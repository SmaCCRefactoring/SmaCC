Class {
	#name : #CGLRLabeledStatementNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'label',
		'statement',
		'case',
		'colonToken',
		'caseToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRLabeledStatementNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitLabeledStatement: self
]

{ #category : #generated }
CGLRLabeledStatementNode >> case [
	^ case
]

{ #category : #generated }
CGLRLabeledStatementNode >> case: anObject [
	case := anObject
]

{ #category : #generated }
CGLRLabeledStatementNode >> caseToken [
	^ caseToken
]

{ #category : #generated }
CGLRLabeledStatementNode >> caseToken: aSmaCCToken [
	caseToken := aSmaCCToken
]

{ #category : #generated }
CGLRLabeledStatementNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
CGLRLabeledStatementNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
CGLRLabeledStatementNode >> label [
	^ label
]

{ #category : #generated }
CGLRLabeledStatementNode >> label: aCGLRIdentifierNode [
	self label notNil
		ifTrue: [ self label parent: nil ].
	label := aCGLRIdentifierNode.
	self label notNil
		ifTrue: [ self label parent: self ]
]

{ #category : #generated }
CGLRLabeledStatementNode >> nodeVariables [
	^ #(#label #statement)
]

{ #category : #generated }
CGLRLabeledStatementNode >> otherVariables [
	^ #(#case)
]

{ #category : #generated }
CGLRLabeledStatementNode >> statement [
	^ statement
]

{ #category : #generated }
CGLRLabeledStatementNode >> statement: aCGLRAbstractNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aCGLRAbstractNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
CGLRLabeledStatementNode >> tokenVariables [
	^ #(#colonToken #caseToken)
]
