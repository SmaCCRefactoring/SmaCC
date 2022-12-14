Class {
	#name : #ASTScopedNameNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'id',
		'colonColonToken',
		'scopedName'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTScopedNameNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitScopedName: self
]

{ #category : #generated }
ASTScopedNameNode >> colonColonToken [
	^ colonColonToken
]

{ #category : #generated }
ASTScopedNameNode >> colonColonToken: aSmaCCToken [
	colonColonToken := aSmaCCToken
]

{ #category : #generated }
ASTScopedNameNode >> id [
	^ id
]

{ #category : #generated }
ASTScopedNameNode >> id: aSmaCCToken [
	id := aSmaCCToken
]

{ #category : #generated }
ASTScopedNameNode >> nodeVariables [
	^ #(#scopedName)
]

{ #category : #generated }
ASTScopedNameNode >> scopedName [
	^ scopedName
]

{ #category : #generated }
ASTScopedNameNode >> scopedName: anASTScopedNameNode [
	self scopedName notNil
		ifTrue: [ self scopedName parent: nil ].
	scopedName := anASTScopedNameNode.
	self scopedName notNil
		ifTrue: [ self scopedName parent: self ]
]

{ #category : #generated }
ASTScopedNameNode >> tokenVariables [
	^ #(#id #colonColonToken)
]
