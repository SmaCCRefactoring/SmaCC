Class {
	#name : #ASTMemberNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'typeSpec',
		'declarators',
		'semicolonToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTMemberNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitMember: self
]

{ #category : #generated }
ASTMemberNode >> declarators [
	^ declarators
]

{ #category : #generated }
ASTMemberNode >> declarators: anASTDeclaratorsNode [
	self declarators notNil
		ifTrue: [ self declarators parent: nil ].
	declarators := anASTDeclaratorsNode.
	self declarators notNil
		ifTrue: [ self declarators parent: self ]
]

{ #category : #generated }
ASTMemberNode >> nodeVariables [
	^ #(#typeSpec #declarators)
]

{ #category : #generated }
ASTMemberNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
ASTMemberNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
ASTMemberNode >> tokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
ASTMemberNode >> typeSpec [
	^ typeSpec
]

{ #category : #generated }
ASTMemberNode >> typeSpec: anASTTypeSpecNode [
	self typeSpec notNil
		ifTrue: [ self typeSpec parent: nil ].
	typeSpec := anASTTypeSpecNode.
	self typeSpec notNil
		ifTrue: [ self typeSpec parent: self ]
]
