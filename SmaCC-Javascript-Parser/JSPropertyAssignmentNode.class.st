Class {
	#name : #JSPropertyAssignmentNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'key',
		'colonToken',
		'value'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSPropertyAssignmentNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPropertyAssignment: self
]

{ #category : #generated }
JSPropertyAssignmentNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
JSPropertyAssignmentNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
JSPropertyAssignmentNode >> ignoredTokenVariables [
	^ #(#colonToken)
]

{ #category : #generated }
JSPropertyAssignmentNode >> key [
	^ key
]

{ #category : #generated }
JSPropertyAssignmentNode >> key: aJSNameExpressionNode [
	self key notNil
		ifTrue: [ self key parent: nil ].
	key := aJSNameExpressionNode.
	self key notNil
		ifTrue: [ self key parent: self ]
]

{ #category : #generated }
JSPropertyAssignmentNode >> nodeVariables [
	^ #(#key #value)
]

{ #category : #generated }
JSPropertyAssignmentNode >> value [
	^ value
]

{ #category : #generated }
JSPropertyAssignmentNode >> value: aJSExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aJSExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
