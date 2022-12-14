Class {
	#name : #ASTMemberListNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'member',
		'memberList'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTMemberListNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitMemberList: self
]

{ #category : #generated }
ASTMemberListNode >> member [
	^ member
]

{ #category : #generated }
ASTMemberListNode >> member: anASTMemberNode [
	self member notNil
		ifTrue: [ self member parent: nil ].
	member := anASTMemberNode.
	self member notNil
		ifTrue: [ self member parent: self ]
]

{ #category : #generated }
ASTMemberListNode >> memberList [
	^ memberList
]

{ #category : #generated }
ASTMemberListNode >> memberList: anASTMemberListNode [
	self memberList notNil
		ifTrue: [ self memberList parent: nil ].
	memberList := anASTMemberListNode.
	self memberList notNil
		ifTrue: [ self memberList parent: self ]
]

{ #category : #generated }
ASTMemberListNode >> nodeVariables [
	^ #(#member #memberList)
]
