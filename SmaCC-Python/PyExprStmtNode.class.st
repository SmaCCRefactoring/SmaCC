Class {
	#name : #PyExprStmtNode,
	#superclass : #PyRootNode,
	#instVars : [
		'assigns',
		'tos',
		'tests',
		'commaTokens'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyExprStmtNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitExprStmt: self
]

{ #category : #generated }
PyExprStmtNode >> assigns [
	^ assigns
]

{ #category : #generated }
PyExprStmtNode >> assigns: anOrderedCollection [
	assigns := anOrderedCollection
]

{ #category : #generated }
PyExprStmtNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyExprStmtNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyExprStmtNode >> compositeNodeVariables [
	^ #(#tests)
]

{ #category : #generated }
PyExprStmtNode >> compositeTokenVariables [
	^ #(#commaTokens #assigns)
]

{ #category : #'generated-initialize-release' }
PyExprStmtNode >> initialize [
	super initialize.
	tests := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	assigns := OrderedCollection new: 2.
	tos := OrderedCollection new: 2.
]

{ #category : #generated }
PyExprStmtNode >> otherVariables [
	^ #(#tos)
]

{ #category : #generated }
PyExprStmtNode >> tests [
	^ tests
]

{ #category : #generated }
PyExprStmtNode >> tests: anOrderedCollection [
	self setParents: self tests to: nil.
	tests := anOrderedCollection.
	self setParents: self tests to: self
]

{ #category : #generated }
PyExprStmtNode >> tos [
	^ tos
]

{ #category : #generated }
PyExprStmtNode >> tos: anOrderedCollection [
	tos := anOrderedCollection
]
