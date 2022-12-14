Class {
	#name : #PySimpleStmtNode,
	#superclass : #PyRootNode,
	#instVars : [
		'semicolonTokens',
		'nEWLINEToken',
		'stmts'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PySimpleStmtNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitSimpleStmt: self
]

{ #category : #generated }
PySimpleStmtNode >> compositeNodeVariables [
	^ #(#stmts)
]

{ #category : #generated }
PySimpleStmtNode >> compositeTokenVariables [
	^ #(#semicolonTokens)
]

{ #category : #'generated-initialize-release' }
PySimpleStmtNode >> initialize [
	super initialize.
	stmts := OrderedCollection new: 2.
	semicolonTokens := OrderedCollection new: 2.
]

{ #category : #generated }
PySimpleStmtNode >> nEWLINEToken [
	^ nEWLINEToken
]

{ #category : #generated }
PySimpleStmtNode >> nEWLINEToken: aSmaCCToken [
	nEWLINEToken := aSmaCCToken
]

{ #category : #generated }
PySimpleStmtNode >> semicolonTokens [
	^ semicolonTokens
]

{ #category : #generated }
PySimpleStmtNode >> semicolonTokens: anOrderedCollection [
	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
PySimpleStmtNode >> stmts [
	^ stmts
]

{ #category : #generated }
PySimpleStmtNode >> stmts: anOrderedCollection [
	self setParents: self stmts to: nil.
	stmts := anOrderedCollection.
	self setParents: self stmts to: self
]

{ #category : #generated }
PySimpleStmtNode >> tokenVariables [
	^ #(#nEWLINEToken)
]
