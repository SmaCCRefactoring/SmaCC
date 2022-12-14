Class {
	#name : #ASTOpTypeSpecNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'paramTypeSpec',
		'voidToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTOpTypeSpecNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitOpTypeSpec: self
]

{ #category : #generated }
ASTOpTypeSpecNode >> nodeVariables [
	^ #(#paramTypeSpec)
]

{ #category : #generated }
ASTOpTypeSpecNode >> paramTypeSpec [
	^ paramTypeSpec
]

{ #category : #generated }
ASTOpTypeSpecNode >> paramTypeSpec: anASTParamTypeSpecNode [
	self paramTypeSpec notNil
		ifTrue: [ self paramTypeSpec parent: nil ].
	paramTypeSpec := anASTParamTypeSpecNode.
	self paramTypeSpec notNil
		ifTrue: [ self paramTypeSpec parent: self ]
]

{ #category : #generated }
ASTOpTypeSpecNode >> tokenVariables [
	^ #(#voidToken)
]

{ #category : #generated }
ASTOpTypeSpecNode >> voidToken [
	^ voidToken
]

{ #category : #generated }
ASTOpTypeSpecNode >> voidToken: aSmaCCToken [
	voidToken := aSmaCCToken
]
