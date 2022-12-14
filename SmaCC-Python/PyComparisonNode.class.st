Class {
	#name : #PyComparisonNode,
	#superclass : #PyRootNode,
	#instVars : [
		'one',
		'op',
		'two'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyComparisonNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitComparison: self
]

{ #category : #generated }
PyComparisonNode >> nodeVariables [
	^ #(#one #op #two)
]

{ #category : #generated }
PyComparisonNode >> one [
	^ one
]

{ #category : #generated }
PyComparisonNode >> one: aPyRootNode [
	self one notNil
		ifTrue: [ self one parent: nil ].
	one := aPyRootNode.
	self one notNil
		ifTrue: [ self one parent: self ]
]

{ #category : #generated }
PyComparisonNode >> op [
	^ op
]

{ #category : #generated }
PyComparisonNode >> op: aPyCompOpNode [
	self op notNil
		ifTrue: [ self op parent: nil ].
	op := aPyCompOpNode.
	self op notNil
		ifTrue: [ self op parent: self ]
]

{ #category : #generated }
PyComparisonNode >> two [
	^ two
]

{ #category : #generated }
PyComparisonNode >> two: aPyRootNode [
	self two notNil
		ifTrue: [ self two parent: nil ].
	two := aPyRootNode.
	self two notNil
		ifTrue: [ self two parent: self ]
]
