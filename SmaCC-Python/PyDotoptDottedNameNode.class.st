Class {
	#name : #PyDotoptDottedNameNode,
	#superclass : #PyRootNode,
	#instVars : [
		'dots',
		'name'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyDotoptDottedNameNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitDotoptDottedName: self
]

{ #category : #generated }
PyDotoptDottedNameNode >> dots [
	^ dots
]

{ #category : #generated }
PyDotoptDottedNameNode >> dots: aPyDotsNode [
	self dots notNil
		ifTrue: [ self dots parent: nil ].
	dots := aPyDotsNode.
	self dots notNil
		ifTrue: [ self dots parent: self ]
]

{ #category : #generated }
PyDotoptDottedNameNode >> name [
	^ name
]

{ #category : #generated }
PyDotoptDottedNameNode >> name: aPyDottedNameNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aPyDottedNameNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
PyDotoptDottedNameNode >> nodeVariables [
	^ #(#name #dots)
]
