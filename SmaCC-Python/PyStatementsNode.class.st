Class {
	#name : #PyStatementsNode,
	#superclass : #PyRootNode,
	#instVars : [
		'statements'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyStatementsNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitStatements: self
]

{ #category : #generated }
PyStatementsNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #'generated-initialize-release' }
PyStatementsNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
PyStatementsNode >> statements [
	^ statements
]

{ #category : #generated }
PyStatementsNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]
