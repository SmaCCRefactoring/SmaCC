Class {
	#name : #ASTConstDclNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'constToken',
		'constType',
		'id',
		'equalToken',
		'constExp'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTConstDclNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitConstDcl: self
]

{ #category : #generated }
ASTConstDclNode >> constExp [
	^ constExp
]

{ #category : #generated }
ASTConstDclNode >> constExp: anASTConstExpNode [
	self constExp notNil
		ifTrue: [ self constExp parent: nil ].
	constExp := anASTConstExpNode.
	self constExp notNil
		ifTrue: [ self constExp parent: self ]
]

{ #category : #generated }
ASTConstDclNode >> constToken [
	^ constToken
]

{ #category : #generated }
ASTConstDclNode >> constToken: aSmaCCToken [
	constToken := aSmaCCToken
]

{ #category : #generated }
ASTConstDclNode >> constType [
	^ constType
]

{ #category : #generated }
ASTConstDclNode >> constType: anASTConstTypeNode [
	self constType notNil
		ifTrue: [ self constType parent: nil ].
	constType := anASTConstTypeNode.
	self constType notNil
		ifTrue: [ self constType parent: self ]
]

{ #category : #generated }
ASTConstDclNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
ASTConstDclNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
ASTConstDclNode >> id [
	^ id
]

{ #category : #generated }
ASTConstDclNode >> id: aSmaCCToken [
	id := aSmaCCToken
]

{ #category : #generated }
ASTConstDclNode >> nodeVariables [
	^ #(#constType #constExp)
]

{ #category : #generated }
ASTConstDclNode >> tokenVariables [
	^ #(#constToken #id #equalToken)
]
