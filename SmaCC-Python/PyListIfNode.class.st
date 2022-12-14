Class {
	#name : #PyListIfNode,
	#superclass : #PyRootNode,
	#instVars : [
		'ifToken',
		'condition',
		'iter'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyListIfNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitListIf: self
]

{ #category : #generated }
PyListIfNode >> condition [
	^ condition
]

{ #category : #generated }
PyListIfNode >> condition: aPyRootNode [
	self condition notNil
		ifTrue: [ self condition parent: nil ].
	condition := aPyRootNode.
	self condition notNil
		ifTrue: [ self condition parent: self ]
]

{ #category : #generated }
PyListIfNode >> ifToken [
	^ ifToken
]

{ #category : #generated }
PyListIfNode >> ifToken: aSmaCCToken [
	ifToken := aSmaCCToken
]

{ #category : #generated }
PyListIfNode >> iter [
	^ iter
]

{ #category : #generated }
PyListIfNode >> iter: aPyRootNode [
	self iter notNil
		ifTrue: [ self iter parent: nil ].
	iter := aPyRootNode.
	self iter notNil
		ifTrue: [ self iter parent: self ]
]

{ #category : #generated }
PyListIfNode >> nodeVariables [
	^ #(#condition #iter)
]

{ #category : #generated }
PyListIfNode >> tokenVariables [
	^ #(#ifToken)
]
