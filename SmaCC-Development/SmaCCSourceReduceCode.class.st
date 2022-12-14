"
SmaCCSourceReduceCode represents a reduce action that is specified in the grammar. In this case, it outputs the code directly into the parser.

Instance Variables
	source	<String>	the source to output


"
Class {
	#name : #SmaCCSourceReduceCode,
	#superclass : #SmaCCReduceCode,
	#instVars : [
		'source'
	],
	#category : 'SmaCC-Development'
}

{ #category : #'instance creation' }
SmaCCSourceReduceCode class >> onRHS: aSmaCCRHS source: aString [
	^ (self onRHS: aSmaCCRHS)
		source: aString;
		yourself
]

{ #category : #comparing }
SmaCCSourceReduceCode >> = anObject [
	^ super = anObject and: [ self source = anObject source ]
]

{ #category : #private }
SmaCCSourceReduceCode >> basicModelTypes: aSet [
	"In fact we parse that thing twice (once in returnedNodeIndex). If it has an error there, we do not recover from it and we never reach the error part."

	| index parseTree |
	index := self returnedNodeIndex.
	index notNil
		ifTrue: [ ^ self basicModelTypes: aSet forIndex: index ].
	parseTree := self reduceExpressionParseTree.
	^ self typesForTree: parseTree with: aSet
]

{ #category : #private }
SmaCCSourceReduceCode >> indexForLiteralOrVariableNode: aRBProgramNode [
	| index |
	(aRBProgramNode isVariable or: [ aRBProgramNode isLiteralNode ])
		ifFalse: [ ^ nil ].
	aRBProgramNode isVariable
		ifTrue: [ ^ rhs indexOfVariable: aRBProgramNode name ].
	aRBProgramNode value isString
		ifFalse: [ ^ nil ].
	(aRBProgramNode value allSatisfy: [ :each | each isDigit ])
		ifTrue: [ index := Integer readFrom: (ReadStream on: aRBProgramNode value).
			(index between: 1 and: rhs size)
				ifTrue: [ ^ index ] ].
	^ nil
]

{ #category : #accessing }
SmaCCSourceReduceCode >> source [
	^ source
]

{ #category : #'initialize-release' }
SmaCCSourceReduceCode >> source: aString [
	source := aString
]

{ #category : #private }
SmaCCSourceReduceCode >> typesForTree: aRBProgramNode with: aSet [
	"The set is important when dealing with variables or number literals being returned."

	aRBProgramNode isReturn
		ifTrue: [ ^ self typesForTree: aRBProgramNode value with: aSet ].
	(aRBProgramNode isSequence
		and: [ aRBProgramNode statements notEmpty ])
		ifTrue: [ | types |
			types := Set
				withAll: (self typesForTree: aRBProgramNode statements last with: aSet).
			aRBProgramNode
				nodesDo: [ :each | 
					each isReturn
						ifTrue: [ types addAll: (self typesForTree: each value with: aSet) ] ].
			^ types asArray ].
	(self indexForLiteralOrVariableNode: aRBProgramNode)
		ifNotNil: [ :i | ^ self basicModelTypes: aSet forIndex: i ].
	aRBProgramNode isLiteralNode
		ifTrue: [ ^ Array with: (self model classFor: aRBProgramNode value class) ].
	(aRBProgramNode isMessage
		and: [ aRBProgramNode receiver isVariable
				and: [ aRBProgramNode receiver name = 'SmaCCToken' ] ])
		ifTrue: [ ^ Array with: (self model classFor: SmaCCToken) ].
	^ Array with: (self model classFor: Object)
]
