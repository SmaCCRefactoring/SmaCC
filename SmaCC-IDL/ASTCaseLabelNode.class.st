Class {
	#name : #ASTCaseLabelNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'caseToken',
		'constExp',
		'colonToken',
		'defaultToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTCaseLabelNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitCaseLabel: self
]

{ #category : #generated }
ASTCaseLabelNode >> caseToken [
	^ caseToken
]

{ #category : #generated }
ASTCaseLabelNode >> caseToken: aSmaCCToken [
	caseToken := aSmaCCToken
]

{ #category : #generated }
ASTCaseLabelNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
ASTCaseLabelNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
ASTCaseLabelNode >> constExp [
	^ constExp
]

{ #category : #generated }
ASTCaseLabelNode >> constExp: anASTConstExpNode [
	self constExp notNil
		ifTrue: [ self constExp parent: nil ].
	constExp := anASTConstExpNode.
	self constExp notNil
		ifTrue: [ self constExp parent: self ]
]

{ #category : #generated }
ASTCaseLabelNode >> defaultToken [
	^ defaultToken
]

{ #category : #generated }
ASTCaseLabelNode >> defaultToken: aSmaCCToken [
	defaultToken := aSmaCCToken
]

{ #category : #generated }
ASTCaseLabelNode >> nodeVariables [
	^ #(#constExp)
]

{ #category : #generated }
ASTCaseLabelNode >> tokenVariables [
	^ #(#caseToken #colonToken #defaultToken)
]
