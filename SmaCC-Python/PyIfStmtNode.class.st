Class {
	#name : #PyIfStmtNode,
	#superclass : #PyRootNode,
	#instVars : [
		'ifToken',
		'if',
		'colonToken',
		'then',
		'elsif',
		'else'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyIfStmtNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitIfStmt: self
]

{ #category : #generated }
PyIfStmtNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
PyIfStmtNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
PyIfStmtNode >> else [
	^ else
]

{ #category : #generated }
PyIfStmtNode >> else: aPyElseNode [
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := aPyElseNode.
	self else notNil
		ifTrue: [ self else parent: self ]
]

{ #category : #generated }
PyIfStmtNode >> elsif [
	^ elsif
]

{ #category : #generated }
PyIfStmtNode >> elsif: aPyRootNode [
	self elsif notNil
		ifTrue: [ self elsif parent: nil ].
	elsif := aPyRootNode.
	self elsif notNil
		ifTrue: [ self elsif parent: self ]
]

{ #category : #generated }
PyIfStmtNode >> if [
	^ if
]

{ #category : #generated }
PyIfStmtNode >> if: anOrderedCollection [
	if := anOrderedCollection
]

{ #category : #generated }
PyIfStmtNode >> ifToken [
	^ ifToken
]

{ #category : #generated }
PyIfStmtNode >> ifToken: aSmaCCToken [
	ifToken := aSmaCCToken
]

{ #category : #generated }
PyIfStmtNode >> nodeVariables [
	^ #(#elsif #else)
]

{ #category : #generated }
PyIfStmtNode >> otherVariables [
	^ #(#if #then)
]

{ #category : #generated }
PyIfStmtNode >> then [
	^ then
]

{ #category : #generated }
PyIfStmtNode >> then: anOrderedCollection [
	then := anOrderedCollection
]

{ #category : #generated }
PyIfStmtNode >> tokenVariables [
	^ #(#ifToken #colonToken)
]
