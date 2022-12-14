Class {
	#name : #ASTInheritanceSpecNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'colonToken',
		'scopedNames'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTInheritanceSpecNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitInheritanceSpec: self
]

{ #category : #generated }
ASTInheritanceSpecNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
ASTInheritanceSpecNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
ASTInheritanceSpecNode >> nodeVariables [
	^ #(#scopedNames)
]

{ #category : #generated }
ASTInheritanceSpecNode >> scopedNames [
	^ scopedNames
]

{ #category : #generated }
ASTInheritanceSpecNode >> scopedNames: anASTScopedNamesNode [
	self scopedNames notNil
		ifTrue: [ self scopedNames parent: nil ].
	scopedNames := anASTScopedNamesNode.
	self scopedNames notNil
		ifTrue: [ self scopedNames parent: self ]
]

{ #category : #generated }
ASTInheritanceSpecNode >> tokenVariables [
	^ #(#colonToken)
]
