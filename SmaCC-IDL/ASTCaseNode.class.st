Class {
	#name : #ASTCaseNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'caseLabels',
		'elementSpec',
		'semicolonToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTCaseNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitCase: self
]

{ #category : #generated }
ASTCaseNode >> caseLabels [
	^ caseLabels
]

{ #category : #generated }
ASTCaseNode >> caseLabels: anASTCaseLabelsNode [
	self caseLabels notNil
		ifTrue: [ self caseLabels parent: nil ].
	caseLabels := anASTCaseLabelsNode.
	self caseLabels notNil
		ifTrue: [ self caseLabels parent: self ]
]

{ #category : #generated }
ASTCaseNode >> elementSpec [
	^ elementSpec
]

{ #category : #generated }
ASTCaseNode >> elementSpec: anASTElementSpecNode [
	self elementSpec notNil
		ifTrue: [ self elementSpec parent: nil ].
	elementSpec := anASTElementSpecNode.
	self elementSpec notNil
		ifTrue: [ self elementSpec parent: self ]
]

{ #category : #generated }
ASTCaseNode >> nodeVariables [
	^ #(#caseLabels #elementSpec)
]

{ #category : #generated }
ASTCaseNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
ASTCaseNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
ASTCaseNode >> tokenVariables [
	^ #(#semicolonToken)
]
