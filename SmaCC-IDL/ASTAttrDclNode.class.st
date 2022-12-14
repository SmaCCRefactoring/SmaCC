Class {
	#name : #ASTAttrDclNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'attributeToken',
		'paramTypeSpec',
		'simpleDeclarators',
		'readonlyToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTAttrDclNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitAttrDcl: self
]

{ #category : #generated }
ASTAttrDclNode >> attributeToken [
	^ attributeToken
]

{ #category : #generated }
ASTAttrDclNode >> attributeToken: aSmaCCToken [
	attributeToken := aSmaCCToken
]

{ #category : #generated }
ASTAttrDclNode >> nodeVariables [
	^ #(#paramTypeSpec #simpleDeclarators)
]

{ #category : #generated }
ASTAttrDclNode >> paramTypeSpec [
	^ paramTypeSpec
]

{ #category : #generated }
ASTAttrDclNode >> paramTypeSpec: anASTParamTypeSpecNode [
	self paramTypeSpec notNil
		ifTrue: [ self paramTypeSpec parent: nil ].
	paramTypeSpec := anASTParamTypeSpecNode.
	self paramTypeSpec notNil
		ifTrue: [ self paramTypeSpec parent: self ]
]

{ #category : #generated }
ASTAttrDclNode >> readonlyToken [
	^ readonlyToken
]

{ #category : #generated }
ASTAttrDclNode >> readonlyToken: aSmaCCToken [
	readonlyToken := aSmaCCToken
]

{ #category : #generated }
ASTAttrDclNode >> simpleDeclarators [
	^ simpleDeclarators
]

{ #category : #generated }
ASTAttrDclNode >> simpleDeclarators: anASTSimpleDeclaratorsNode [
	self simpleDeclarators notNil
		ifTrue: [ self simpleDeclarators parent: nil ].
	simpleDeclarators := anASTSimpleDeclaratorsNode.
	self simpleDeclarators notNil
		ifTrue: [ self simpleDeclarators parent: self ]
]

{ #category : #generated }
ASTAttrDclNode >> tokenVariables [
	^ #(#attributeToken #readonlyToken)
]
