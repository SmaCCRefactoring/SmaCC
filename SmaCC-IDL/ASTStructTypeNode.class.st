Class {
	#name : #ASTStructTypeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'structToken',
		'id',
		'leftBraceToken',
		'memberList',
		'rightBraceToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTStructTypeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitStructType: self
]

{ #category : #generated }
ASTStructTypeNode >> id [
	^ id
]

{ #category : #generated }
ASTStructTypeNode >> id: aSmaCCToken [
	id := aSmaCCToken
]

{ #category : #generated }
ASTStructTypeNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
ASTStructTypeNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTStructTypeNode >> memberList [
	^ memberList
]

{ #category : #generated }
ASTStructTypeNode >> memberList: anASTMemberListNode [
	self memberList notNil
		ifTrue: [ self memberList parent: nil ].
	memberList := anASTMemberListNode.
	self memberList notNil
		ifTrue: [ self memberList parent: self ]
]

{ #category : #generated }
ASTStructTypeNode >> nodeVariables [
	^ #(#memberList)
]

{ #category : #generated }
ASTStructTypeNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
ASTStructTypeNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTStructTypeNode >> structToken [
	^ structToken
]

{ #category : #generated }
ASTStructTypeNode >> structToken: aSmaCCToken [
	structToken := aSmaCCToken
]

{ #category : #generated }
ASTStructTypeNode >> tokenVariables [
	^ #(#structToken #id #leftBraceToken #rightBraceToken)
]
