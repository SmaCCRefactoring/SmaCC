Class {
	#name : #PyDecoratorsNode,
	#superclass : #PyRootNode,
	#instVars : [
		'decorators'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyDecoratorsNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitDecorators: self
]

{ #category : #generated }
PyDecoratorsNode >> compositeNodeVariables [
	^ #(#decorators)
]

{ #category : #generated }
PyDecoratorsNode >> decorators [
	^ decorators
]

{ #category : #generated }
PyDecoratorsNode >> decorators: anOrderedCollection [
	self setParents: self decorators to: nil.
	decorators := anOrderedCollection.
	self setParents: self decorators to: self
]

{ #category : #'generated-initialize-release' }
PyDecoratorsNode >> initialize [
	super initialize.
	decorators := OrderedCollection new: 2.
]
