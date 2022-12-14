Class {
	#name : #ASTSequenceTypeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'sequenceToken',
		'lessThanToken',
		'simpleTypeSpec',
		'commaToken',
		'positiveIntConst',
		'greaterThanToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTSequenceTypeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitSequenceType: self
]

{ #category : #generated }
ASTSequenceTypeNode >> commaToken [
	^ commaToken
]

{ #category : #generated }
ASTSequenceTypeNode >> commaToken: aSmaCCToken [
	commaToken := aSmaCCToken
]

{ #category : #generated }
ASTSequenceTypeNode >> greaterThanToken [
	^ greaterThanToken
]

{ #category : #generated }
ASTSequenceTypeNode >> greaterThanToken: aSmaCCToken [
	greaterThanToken := aSmaCCToken
]

{ #category : #generated }
ASTSequenceTypeNode >> lessThanToken [
	^ lessThanToken
]

{ #category : #generated }
ASTSequenceTypeNode >> lessThanToken: aSmaCCToken [
	lessThanToken := aSmaCCToken
]

{ #category : #generated }
ASTSequenceTypeNode >> nodeVariables [
	^ #(#simpleTypeSpec #positiveIntConst)
]

{ #category : #generated }
ASTSequenceTypeNode >> positiveIntConst [
	^ positiveIntConst
]

{ #category : #generated }
ASTSequenceTypeNode >> positiveIntConst: anASTPositiveIntConstNode [
	self positiveIntConst notNil
		ifTrue: [ self positiveIntConst parent: nil ].
	positiveIntConst := anASTPositiveIntConstNode.
	self positiveIntConst notNil
		ifTrue: [ self positiveIntConst parent: self ]
]

{ #category : #generated }
ASTSequenceTypeNode >> sequenceToken [
	^ sequenceToken
]

{ #category : #generated }
ASTSequenceTypeNode >> sequenceToken: aSmaCCToken [
	sequenceToken := aSmaCCToken
]

{ #category : #generated }
ASTSequenceTypeNode >> simpleTypeSpec [
	^ simpleTypeSpec
]

{ #category : #generated }
ASTSequenceTypeNode >> simpleTypeSpec: anASTSimpleTypeSpecNode [
	self simpleTypeSpec notNil
		ifTrue: [ self simpleTypeSpec parent: nil ].
	simpleTypeSpec := anASTSimpleTypeSpecNode.
	self simpleTypeSpec notNil
		ifTrue: [ self simpleTypeSpec parent: self ]
]

{ #category : #generated }
ASTSequenceTypeNode >> tokenVariables [
	^ #(#sequenceToken #lessThanToken #commaToken #greaterThanToken)
]
