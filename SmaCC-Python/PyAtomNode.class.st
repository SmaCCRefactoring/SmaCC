Class {
	#name : #PyAtomNode,
	#superclass : #PyRootNode,
	#instVars : [
		'lparenToken',
		'rparenToken',
		'list',
		'lbrackToken',
		'rbrackToken',
		'lcurlyToken',
		'rcurlyToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyAtomNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitAtom: self
]

{ #category : #generated }
PyAtomNode >> lbrackToken [
	^ lbrackToken
]

{ #category : #generated }
PyAtomNode >> lbrackToken: aSmaCCToken [
	lbrackToken := aSmaCCToken
]

{ #category : #generated }
PyAtomNode >> lcurlyToken [
	^ lcurlyToken
]

{ #category : #generated }
PyAtomNode >> lcurlyToken: aSmaCCToken [
	lcurlyToken := aSmaCCToken
]

{ #category : #generated }
PyAtomNode >> list [
	^ list
]

{ #category : #generated }
PyAtomNode >> list: anObject [
	list := anObject
]

{ #category : #generated }
PyAtomNode >> lparenToken [
	^ lparenToken
]

{ #category : #generated }
PyAtomNode >> lparenToken: aSmaCCToken [
	lparenToken := aSmaCCToken
]

{ #category : #generated }
PyAtomNode >> otherVariables [
	^ #(#list)
]

{ #category : #generated }
PyAtomNode >> rbrackToken [
	^ rbrackToken
]

{ #category : #generated }
PyAtomNode >> rbrackToken: aSmaCCToken [
	rbrackToken := aSmaCCToken
]

{ #category : #generated }
PyAtomNode >> rcurlyToken [
	^ rcurlyToken
]

{ #category : #generated }
PyAtomNode >> rcurlyToken: aSmaCCToken [
	rcurlyToken := aSmaCCToken
]

{ #category : #generated }
PyAtomNode >> rparenToken [
	^ rparenToken
]

{ #category : #generated }
PyAtomNode >> rparenToken: aSmaCCToken [
	rparenToken := aSmaCCToken
]

{ #category : #generated }
PyAtomNode >> tokenVariables [
	^ #(#lparenToken #rparenToken #lbrackToken #rbrackToken #lcurlyToken #rcurlyToken)
]
