Class {
	#name : #ASTSwitchBodyNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'case',
		'switchBody'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTSwitchBodyNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitSwitchBody: self
]

{ #category : #generated }
ASTSwitchBodyNode >> case [
	^ case
]

{ #category : #generated }
ASTSwitchBodyNode >> case: anASTCaseNode [
	self case notNil
		ifTrue: [ self case parent: nil ].
	case := anASTCaseNode.
	self case notNil
		ifTrue: [ self case parent: self ]
]

{ #category : #generated }
ASTSwitchBodyNode >> nodeVariables [
	^ #(#case #switchBody)
]

{ #category : #generated }
ASTSwitchBodyNode >> switchBody [
	^ switchBody
]

{ #category : #generated }
ASTSwitchBodyNode >> switchBody: anASTSwitchBodyNode [
	self switchBody notNil
		ifTrue: [ self switchBody parent: nil ].
	switchBody := anASTSwitchBodyNode.
	self switchBody notNil
		ifTrue: [ self switchBody parent: self ]
]
