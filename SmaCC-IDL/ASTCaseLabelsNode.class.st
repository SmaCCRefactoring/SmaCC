Class {
	#name : #ASTCaseLabelsNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'caseLabel',
		'caseLabels'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTCaseLabelsNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitCaseLabels: self
]

{ #category : #generated }
ASTCaseLabelsNode >> caseLabel [
	^ caseLabel
]

{ #category : #generated }
ASTCaseLabelsNode >> caseLabel: anASTCaseLabelNode [
	self caseLabel notNil
		ifTrue: [ self caseLabel parent: nil ].
	caseLabel := anASTCaseLabelNode.
	self caseLabel notNil
		ifTrue: [ self caseLabel parent: self ]
]

{ #category : #generated }
ASTCaseLabelsNode >> caseLabels [
	^ caseLabels
]

{ #category : #generated }
ASTCaseLabelsNode >> caseLabels: anASTCaseLabelsNode [
	self caseLabels notNil
		ifTrue: [ self caseLabels parent: nil ].
	caseLabels := anASTCaseLabelsNode.
	self caseLabels notNil
		ifTrue: [ self caseLabels parent: self ]
]

{ #category : #generated }
ASTCaseLabelsNode >> nodeVariables [
	^ #(#caseLabel #caseLabels)
]
