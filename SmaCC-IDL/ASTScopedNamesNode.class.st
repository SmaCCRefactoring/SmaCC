Class {
	#name : #ASTScopedNamesNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'scopedName',
		'scopedNames',
		'commaToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTScopedNamesNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitScopedNames: self
]

{ #category : #generated }
ASTScopedNamesNode >> commaToken [
	^ commaToken
]

{ #category : #generated }
ASTScopedNamesNode >> commaToken: aSmaCCToken [
	commaToken := aSmaCCToken
]

{ #category : #generated }
ASTScopedNamesNode >> nodeVariables [
	^ #(#scopedName #scopedNames)
]

{ #category : #generated }
ASTScopedNamesNode >> scopedName [
	^ scopedName
]

{ #category : #generated }
ASTScopedNamesNode >> scopedName: anASTScopedNameNode [
	self scopedName notNil
		ifTrue: [ self scopedName parent: nil ].
	scopedName := anASTScopedNameNode.
	self scopedName notNil
		ifTrue: [ self scopedName parent: self ]
]

{ #category : #generated }
ASTScopedNamesNode >> scopedNames [
	^ scopedNames
]

{ #category : #generated }
ASTScopedNamesNode >> scopedNames: anASTScopedNamesNode [
	self scopedNames notNil
		ifTrue: [ self scopedNames parent: nil ].
	scopedNames := anASTScopedNamesNode.
	self scopedNames notNil
		ifTrue: [ self scopedNames parent: self ]
]

{ #category : #generated }
ASTScopedNamesNode >> tokenVariables [
	^ #(#commaToken)
]
