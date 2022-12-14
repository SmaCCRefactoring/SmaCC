Class {
	#name : #PyTestlistCompNode,
	#superclass : #PyRootNode,
	#instVars : [
		'test',
		'comp_for'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyTestlistCompNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitTestlistComp: self
]

{ #category : #generated }
PyTestlistCompNode >> comp_for [
	^ comp_for
]

{ #category : #generated }
PyTestlistCompNode >> comp_for: aPyCompForNode [
	self comp_for notNil
		ifTrue: [ self comp_for parent: nil ].
	comp_for := aPyCompForNode.
	self comp_for notNil
		ifTrue: [ self comp_for parent: self ]
]

{ #category : #generated }
PyTestlistCompNode >> nodeVariables [
	^ #(#test #comp_for)
]

{ #category : #generated }
PyTestlistCompNode >> test [
	^ test
]

{ #category : #generated }
PyTestlistCompNode >> test: aPyRootNode [
	self test notNil
		ifTrue: [ self test parent: nil ].
	test := aPyRootNode.
	self test notNil
		ifTrue: [ self test parent: self ]
]
