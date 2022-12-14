Class {
	#name : #ASTExceptDclNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'exceptionToken',
		'id',
		'leftBraceToken',
		'memberList',
		'rightBraceToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTExceptDclNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitExceptDcl: self
]

{ #category : #generated }
ASTExceptDclNode >> exceptionToken [
	^ exceptionToken
]

{ #category : #generated }
ASTExceptDclNode >> exceptionToken: aSmaCCToken [
	exceptionToken := aSmaCCToken
]

{ #category : #generated }
ASTExceptDclNode >> id [
	^ id
]

{ #category : #generated }
ASTExceptDclNode >> id: aSmaCCToken [
	id := aSmaCCToken
]

{ #category : #generated }
ASTExceptDclNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
ASTExceptDclNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTExceptDclNode >> memberList [
	^ memberList
]

{ #category : #generated }
ASTExceptDclNode >> memberList: anASTMemberListNode [
	self memberList notNil
		ifTrue: [ self memberList parent: nil ].
	memberList := anASTMemberListNode.
	self memberList notNil
		ifTrue: [ self memberList parent: self ]
]

{ #category : #generated }
ASTExceptDclNode >> nodeVariables [
	^ #(#memberList)
]

{ #category : #generated }
ASTExceptDclNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
ASTExceptDclNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTExceptDclNode >> tokenVariables [
	^ #(#exceptionToken #id #leftBraceToken #rightBraceToken)
]
