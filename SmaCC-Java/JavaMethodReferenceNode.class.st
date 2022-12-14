Class {
	#name : #JavaMethodReferenceNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'receiver',
		'colonColonToken',
		'name'
	],
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaMethodReferenceNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMethodReference: self
]

{ #category : #generated }
JavaMethodReferenceNode >> colonColonToken [
	^ colonColonToken
]

{ #category : #generated }
JavaMethodReferenceNode >> colonColonToken: aSmaCCToken [
	colonColonToken := aSmaCCToken
]

{ #category : #generated }
JavaMethodReferenceNode >> name [
	^ name
]

{ #category : #generated }
JavaMethodReferenceNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaMethodReferenceNode >> nodeVariables [
	^ #(#receiver)
]

{ #category : #generated }
JavaMethodReferenceNode >> receiver [
	^ receiver
]

{ #category : #generated }
JavaMethodReferenceNode >> receiver: aJavaExpressionNode [
	self receiver notNil
		ifTrue: [ self receiver parent: nil ].
	receiver := aJavaExpressionNode.
	self receiver notNil
		ifTrue: [ self receiver parent: self ]
]

{ #category : #generated }
JavaMethodReferenceNode >> tokenVariables [
	^ #(#colonColonToken #name)
]
