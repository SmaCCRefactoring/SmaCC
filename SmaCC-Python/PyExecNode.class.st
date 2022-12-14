Class {
	#name : #PyExecNode,
	#superclass : #PyRootNode,
	#instVars : [
		'execToken',
		'expr',
		'inToken',
		'tests_opt'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyExecNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitExec: self
]

{ #category : #generated }
PyExecNode >> execToken [
	^ execToken
]

{ #category : #generated }
PyExecNode >> execToken: aSmaCCToken [
	execToken := aSmaCCToken
]

{ #category : #generated }
PyExecNode >> expr [
	^ expr
]

{ #category : #generated }
PyExecNode >> expr: aPyRootNode [
	self expr notNil
		ifTrue: [ self expr parent: nil ].
	expr := aPyRootNode.
	self expr notNil
		ifTrue: [ self expr parent: self ]
]

{ #category : #generated }
PyExecNode >> inToken [
	^ inToken
]

{ #category : #generated }
PyExecNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
PyExecNode >> nodeVariables [
	^ #(#expr #tests_opt)
]

{ #category : #generated }
PyExecNode >> tests_opt [
	^ tests_opt
]

{ #category : #generated }
PyExecNode >> tests_opt: aPyTestTestOptNode [
	self tests_opt notNil
		ifTrue: [ self tests_opt parent: nil ].
	tests_opt := aPyTestTestOptNode.
	self tests_opt notNil
		ifTrue: [ self tests_opt parent: self ]
]

{ #category : #generated }
PyExecNode >> tokenVariables [
	^ #(#execToken #inToken)
]
