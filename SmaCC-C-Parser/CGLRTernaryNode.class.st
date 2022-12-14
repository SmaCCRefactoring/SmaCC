Class {
	#name : #CGLRTernaryNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'condition',
		'else',
		'questionMarkToken',
		'colonToken',
		'then'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRTernaryNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitTernary: self
]

{ #category : #generated }
CGLRTernaryNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
CGLRTernaryNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
CGLRTernaryNode >> condition [
	^ condition
]

{ #category : #generated }
CGLRTernaryNode >> condition: aCGLRAbstractNode [
	self condition notNil
		ifTrue: [ self condition parent: nil ].
	condition := aCGLRAbstractNode.
	self condition notNil
		ifTrue: [ self condition parent: self ]
]

{ #category : #generated }
CGLRTernaryNode >> else [
	^ else
]

{ #category : #generated }
CGLRTernaryNode >> else: aCGLRAbstractNode [
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := aCGLRAbstractNode.
	self else notNil
		ifTrue: [ self else parent: self ]
]

{ #category : #generated }
CGLRTernaryNode >> nodeVariables [
	^ #(#condition #then #else)
]

{ #category : #generated }
CGLRTernaryNode >> questionMarkToken [
	^ questionMarkToken
]

{ #category : #generated }
CGLRTernaryNode >> questionMarkToken: aSmaCCToken [
	questionMarkToken := aSmaCCToken
]

{ #category : #generated }
CGLRTernaryNode >> then [
	^ then
]

{ #category : #generated }
CGLRTernaryNode >> then: aCGLRExpressionNode [
	self then notNil
		ifTrue: [ self then parent: nil ].
	then := aCGLRExpressionNode.
	self then notNil
		ifTrue: [ self then parent: self ]
]

{ #category : #generated }
CGLRTernaryNode >> tokenVariables [
	^ #(#questionMarkToken #colonToken)
]
