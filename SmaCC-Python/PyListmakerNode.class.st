Class {
	#name : #PyListmakerNode,
	#superclass : #PyRootNode,
	#instVars : [
		'test',
		'list_for'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyListmakerNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitListmaker: self
]

{ #category : #generated }
PyListmakerNode >> list_for [
	^ list_for
]

{ #category : #generated }
PyListmakerNode >> list_for: aPyListForNode [
	self list_for notNil
		ifTrue: [ self list_for parent: nil ].
	list_for := aPyListForNode.
	self list_for notNil
		ifTrue: [ self list_for parent: self ]
]

{ #category : #generated }
PyListmakerNode >> nodeVariables [
	^ #(#test #list_for)
]

{ #category : #generated }
PyListmakerNode >> test [
	^ test
]

{ #category : #generated }
PyListmakerNode >> test: aPyRootNode [
	self test notNil
		ifTrue: [ self test parent: nil ].
	test := aPyRootNode.
	self test notNil
		ifTrue: [ self test parent: self ]
]
