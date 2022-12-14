Class {
	#name : #JSGetPropertyAssignmentNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'getToken',
		'key',
		'leftParen',
		'rightParen',
		'leftBrace',
		'statements',
		'rightBrace'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSGetPropertyAssignmentNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitGetPropertyAssignment: self
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> getToken [
	^ getToken
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> getToken: aSmaCCToken [
	getToken := aSmaCCToken
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen #leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JSGetPropertyAssignmentNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> key [
	^ key
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> key: aJSNameExpressionNode [
	self key notNil
		ifTrue: [ self key parent: nil ].
	key := aJSNameExpressionNode.
	self key notNil
		ifTrue: [ self key parent: self ]
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> nodeVariables [
	^ #(#key)
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> statements [
	^ statements
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
JSGetPropertyAssignmentNode >> tokenVariables [
	^ #(#getToken)
]
