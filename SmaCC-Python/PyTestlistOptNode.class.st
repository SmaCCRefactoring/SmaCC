Class {
	#name : #PyTestlistOptNode,
	#superclass : #PyRootNode,
	#instVars : [
		'tests'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyTestlistOptNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitTestlistOpt: self
]

{ #category : #generated }
PyTestlistOptNode >> nodeVariables [
	^ #(#tests)
]

{ #category : #generated }
PyTestlistOptNode >> tests [
	^ tests
]

{ #category : #generated }
PyTestlistOptNode >> tests: aPyTestlistNode [
	self tests notNil
		ifTrue: [ self tests parent: nil ].
	tests := aPyTestlistNode.
	self tests notNil
		ifTrue: [ self tests parent: self ]
]
