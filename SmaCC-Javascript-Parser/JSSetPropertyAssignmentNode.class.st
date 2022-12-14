Class {
	#name : #JSSetPropertyAssignmentNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'setToken',
		'key',
		'leftParen',
		'variable',
		'rightParen',
		'leftBrace',
		'statements',
		'rightBrace'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSSetPropertyAssignmentNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSetPropertyAssignment: self
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen #leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JSSetPropertyAssignmentNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> key [
	^ key
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> key: aJSNameExpressionNode [
	self key notNil
		ifTrue: [ self key parent: nil ].
	key := aJSNameExpressionNode.
	self key notNil
		ifTrue: [ self key parent: self ]
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> nodeVariables [
	^ #(#key)
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> setToken [
	^ setToken
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> setToken: aSmaCCToken [
	setToken := aSmaCCToken
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> statements [
	^ statements
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> tokenVariables [
	^ #(#setToken #variable)
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> variable [
	^ variable
]

{ #category : #generated }
JSSetPropertyAssignmentNode >> variable: aSmaCCToken [
	variable := aSmaCCToken
]
