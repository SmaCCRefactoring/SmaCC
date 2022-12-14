Class {
	#name : #ASTExportNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'typeDcl',
		'semicolonToken',
		'constDcl',
		'exceptDcl',
		'attrDcl',
		'opDcl'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTExportNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitExport: self
]

{ #category : #generated }
ASTExportNode >> attrDcl [
	^ attrDcl
]

{ #category : #generated }
ASTExportNode >> attrDcl: anASTAttrDclNode [
	self attrDcl notNil
		ifTrue: [ self attrDcl parent: nil ].
	attrDcl := anASTAttrDclNode.
	self attrDcl notNil
		ifTrue: [ self attrDcl parent: self ]
]

{ #category : #generated }
ASTExportNode >> constDcl [
	^ constDcl
]

{ #category : #generated }
ASTExportNode >> constDcl: anASTConstDclNode [
	self constDcl notNil
		ifTrue: [ self constDcl parent: nil ].
	constDcl := anASTConstDclNode.
	self constDcl notNil
		ifTrue: [ self constDcl parent: self ]
]

{ #category : #generated }
ASTExportNode >> exceptDcl [
	^ exceptDcl
]

{ #category : #generated }
ASTExportNode >> exceptDcl: anASTExceptDclNode [
	self exceptDcl notNil
		ifTrue: [ self exceptDcl parent: nil ].
	exceptDcl := anASTExceptDclNode.
	self exceptDcl notNil
		ifTrue: [ self exceptDcl parent: self ]
]

{ #category : #generated }
ASTExportNode >> nodeVariables [
	^ #(#typeDcl #constDcl #exceptDcl #attrDcl #opDcl)
]

{ #category : #generated }
ASTExportNode >> opDcl [
	^ opDcl
]

{ #category : #generated }
ASTExportNode >> opDcl: anASTOpDclNode [
	self opDcl notNil
		ifTrue: [ self opDcl parent: nil ].
	opDcl := anASTOpDclNode.
	self opDcl notNil
		ifTrue: [ self opDcl parent: self ]
]

{ #category : #generated }
ASTExportNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
ASTExportNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
ASTExportNode >> tokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
ASTExportNode >> typeDcl [
	^ typeDcl
]

{ #category : #generated }
ASTExportNode >> typeDcl: anASTTypeDclNode [
	self typeDcl notNil
		ifTrue: [ self typeDcl parent: nil ].
	typeDcl := anASTTypeDclNode.
	self typeDcl notNil
		ifTrue: [ self typeDcl parent: self ]
]
