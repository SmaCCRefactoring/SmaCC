Class {
	#name : #PyImportNode,
	#superclass : #PyRootNode,
	#instVars : [
		'importToken',
		'commaTokens',
		'names',
		'asTokens',
		'renames',
		'fromToken',
		'from',
		'timesToken',
		'lparenToken',
		'rparenToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyImportNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitImport: self
]

{ #category : #generated }
PyImportNode >> asTokens [
	^ asTokens
]

{ #category : #generated }
PyImportNode >> asTokens: anOrderedCollection [
	asTokens := anOrderedCollection
]

{ #category : #generated }
PyImportNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyImportNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyImportNode >> compositeTokenVariables [
	^ #(#commaTokens #asTokens #renames)
]

{ #category : #generated }
PyImportNode >> from [
	^ from
]

{ #category : #generated }
PyImportNode >> from: aPyDotoptDottedNameNode [
	self from notNil
		ifTrue: [ self from parent: nil ].
	from := aPyDotoptDottedNameNode.
	self from notNil
		ifTrue: [ self from parent: self ]
]

{ #category : #generated }
PyImportNode >> fromToken [
	^ fromToken
]

{ #category : #generated }
PyImportNode >> fromToken: aSmaCCToken [
	fromToken := aSmaCCToken
]

{ #category : #generated }
PyImportNode >> importToken [
	^ importToken
]

{ #category : #generated }
PyImportNode >> importToken: aSmaCCToken [
	importToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
PyImportNode >> initialize [
	super initialize.
	commaTokens := OrderedCollection new: 2.
	names := OrderedCollection new: 2.
	asTokens := OrderedCollection new: 2.
	renames := OrderedCollection new: 2.
]

{ #category : #generated }
PyImportNode >> lparenToken [
	^ lparenToken
]

{ #category : #generated }
PyImportNode >> lparenToken: aSmaCCToken [
	lparenToken := aSmaCCToken
]

{ #category : #generated }
PyImportNode >> names [
	^ names
]

{ #category : #generated }
PyImportNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
PyImportNode >> nodeVariables [
	^ #(#from)
]

{ #category : #generated }
PyImportNode >> otherVariables [
	^ #(#names)
]

{ #category : #generated }
PyImportNode >> renames [
	^ renames
]

{ #category : #generated }
PyImportNode >> renames: anOrderedCollection [
	renames := anOrderedCollection
]

{ #category : #generated }
PyImportNode >> rparenToken [
	^ rparenToken
]

{ #category : #generated }
PyImportNode >> rparenToken: aSmaCCToken [
	rparenToken := aSmaCCToken
]

{ #category : #generated }
PyImportNode >> timesToken [
	^ timesToken
]

{ #category : #generated }
PyImportNode >> timesToken: aSmaCCToken [
	timesToken := aSmaCCToken
]

{ #category : #generated }
PyImportNode >> tokenVariables [
	^ #(#importToken #fromToken #timesToken #lparenToken #rparenToken)
]
