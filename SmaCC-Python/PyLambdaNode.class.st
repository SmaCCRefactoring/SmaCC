Class {
	#name : #PyLambdaNode,
	#superclass : #PyRootNode,
	#instVars : [
		'lambdaToken',
		'args',
		'colonToken',
		'body',
		'arguments'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyLambdaNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitLambda: self
]

{ #category : #generated }
PyLambdaNode >> args [
	^ args
]

{ #category : #generated }
PyLambdaNode >> args: aPyVarArgListNode [
	self args notNil
		ifTrue: [ self args parent: nil ].
	args := aPyVarArgListNode.
	self args notNil
		ifTrue: [ self args parent: self ]
]

{ #category : #generated }
PyLambdaNode >> arguments [
	^ arguments
]

{ #category : #generated }
PyLambdaNode >> arguments: aPyVarArgListNode [
	self arguments notNil
		ifTrue: [ self arguments parent: nil ].
	arguments := aPyVarArgListNode.
	self arguments notNil
		ifTrue: [ self arguments parent: self ]
]

{ #category : #generated }
PyLambdaNode >> body [
	^ body
]

{ #category : #generated }
PyLambdaNode >> body: aPyRootNode [
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aPyRootNode.
	self body notNil
		ifTrue: [ self body parent: self ]
]

{ #category : #generated }
PyLambdaNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
PyLambdaNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
PyLambdaNode >> lambdaToken [
	^ lambdaToken
]

{ #category : #generated }
PyLambdaNode >> lambdaToken: aSmaCCToken [
	lambdaToken := aSmaCCToken
]

{ #category : #generated }
PyLambdaNode >> nodeVariables [
	^ #(#args #body #arguments)
]

{ #category : #generated }
PyLambdaNode >> tokenVariables [
	^ #(#lambdaToken #colonToken)
]
