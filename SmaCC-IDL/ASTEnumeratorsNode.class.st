Class {
	#name : #ASTEnumeratorsNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'enumerator',
		'enumerators',
		'commaToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTEnumeratorsNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitEnumerators: self
]

{ #category : #generated }
ASTEnumeratorsNode >> commaToken [
	^ commaToken
]

{ #category : #generated }
ASTEnumeratorsNode >> commaToken: aSmaCCToken [
	commaToken := aSmaCCToken
]

{ #category : #generated }
ASTEnumeratorsNode >> enumerator [
	^ enumerator
]

{ #category : #generated }
ASTEnumeratorsNode >> enumerator: anASTEnumeratorNode [
	self enumerator notNil
		ifTrue: [ self enumerator parent: nil ].
	enumerator := anASTEnumeratorNode.
	self enumerator notNil
		ifTrue: [ self enumerator parent: self ]
]

{ #category : #generated }
ASTEnumeratorsNode >> enumerators [
	^ enumerators
]

{ #category : #generated }
ASTEnumeratorsNode >> enumerators: anASTEnumeratorsNode [
	self enumerators notNil
		ifTrue: [ self enumerators parent: nil ].
	enumerators := anASTEnumeratorsNode.
	self enumerators notNil
		ifTrue: [ self enumerators parent: self ]
]

{ #category : #generated }
ASTEnumeratorsNode >> nodeVariables [
	^ #(#enumerator #enumerators)
]

{ #category : #generated }
ASTEnumeratorsNode >> tokenVariables [
	^ #(#commaToken)
]
