Class {
	#name : #PyDecoratorNode,
	#superclass : #PyRootNode,
	#instVars : [
		'_Token',
		'nEWLINEToken',
		'dotted_name',
		'args'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyDecoratorNode >> _Token [
	^ _Token
]

{ #category : #generated }
PyDecoratorNode >> _Token: aSmaCCToken [
	_Token := aSmaCCToken
]

{ #category : #generated }
PyDecoratorNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitDecorator: self
]

{ #category : #generated }
PyDecoratorNode >> args [
	^ args
]

{ #category : #generated }
PyDecoratorNode >> args: anOrderedCollection [
	args := anOrderedCollection
]

{ #category : #generated }
PyDecoratorNode >> dotted_name [
	^ dotted_name
]

{ #category : #generated }
PyDecoratorNode >> dotted_name: aPyDottedNameNode [
	self dotted_name notNil
		ifTrue: [ self dotted_name parent: nil ].
	dotted_name := aPyDottedNameNode.
	self dotted_name notNil
		ifTrue: [ self dotted_name parent: self ]
]

{ #category : #generated }
PyDecoratorNode >> nEWLINEToken [
	^ nEWLINEToken
]

{ #category : #generated }
PyDecoratorNode >> nEWLINEToken: aSmaCCToken [
	nEWLINEToken := aSmaCCToken
]

{ #category : #generated }
PyDecoratorNode >> nodeVariables [
	^ #(#dotted_name)
]

{ #category : #generated }
PyDecoratorNode >> otherVariables [
	^ #(#args)
]

{ #category : #generated }
PyDecoratorNode >> tokenVariables [
	^ #(#_Token #nEWLINEToken)
]
