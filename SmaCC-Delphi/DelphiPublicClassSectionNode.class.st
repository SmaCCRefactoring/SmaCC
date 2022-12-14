Class {
	#name : #DelphiPublicClassSectionNode,
	#superclass : #DelphiClassSectionNode,
	#instVars : [
		'publicToken'
	],
	#category : 'SmaCC-Delphi'
}

{ #category : #generated }
DelphiPublicClassSectionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPublicClassSection: self
]

{ #category : #generated }
DelphiPublicClassSectionNode >> publicToken [
	^ publicToken
]

{ #category : #generated }
DelphiPublicClassSectionNode >> publicToken: aSmaCCToken [
	publicToken := aSmaCCToken
]

{ #category : #generated }
DelphiPublicClassSectionNode >> tokenVariables [
	^ #(#publicToken)
]
