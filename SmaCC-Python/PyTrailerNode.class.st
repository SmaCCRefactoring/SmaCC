Class {
	#name : #PyTrailerNode,
	#superclass : #PyRootNode,
	#instVars : [
		'lparenToken',
		'rparenToken',
		'arguments',
		'commaTokens',
		'timesToken',
		'timesTimesToken',
		'lbrackToken',
		'subscripts',
		'rbrackToken',
		'periodToken',
		'nameToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyTrailerNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitTrailer: self
]

{ #category : #generated }
PyTrailerNode >> arguments [
	^ arguments
]

{ #category : #generated }
PyTrailerNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
PyTrailerNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyTrailerNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyTrailerNode >> compositeNodeVariables [
	^ #(#arguments #subscripts)
]

{ #category : #generated }
PyTrailerNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
PyTrailerNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	subscripts := OrderedCollection new: 2.
]

{ #category : #generated }
PyTrailerNode >> lbrackToken [
	^ lbrackToken
]

{ #category : #generated }
PyTrailerNode >> lbrackToken: aSmaCCToken [
	lbrackToken := aSmaCCToken
]

{ #category : #generated }
PyTrailerNode >> lparenToken [
	^ lparenToken
]

{ #category : #generated }
PyTrailerNode >> lparenToken: aSmaCCToken [
	lparenToken := aSmaCCToken
]

{ #category : #generated }
PyTrailerNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
PyTrailerNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
PyTrailerNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
PyTrailerNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
PyTrailerNode >> rbrackToken [
	^ rbrackToken
]

{ #category : #generated }
PyTrailerNode >> rbrackToken: aSmaCCToken [
	rbrackToken := aSmaCCToken
]

{ #category : #generated }
PyTrailerNode >> rparenToken [
	^ rparenToken
]

{ #category : #generated }
PyTrailerNode >> rparenToken: aSmaCCToken [
	rparenToken := aSmaCCToken
]

{ #category : #generated }
PyTrailerNode >> subscripts [
	^ subscripts
]

{ #category : #generated }
PyTrailerNode >> subscripts: anOrderedCollection [
	self setParents: self subscripts to: nil.
	subscripts := anOrderedCollection.
	self setParents: self subscripts to: self
]

{ #category : #generated }
PyTrailerNode >> timesTimesToken [
	^ timesTimesToken
]

{ #category : #generated }
PyTrailerNode >> timesTimesToken: aSmaCCToken [
	timesTimesToken := aSmaCCToken
]

{ #category : #generated }
PyTrailerNode >> timesToken [
	^ timesToken
]

{ #category : #generated }
PyTrailerNode >> timesToken: aSmaCCToken [
	timesToken := aSmaCCToken
]

{ #category : #generated }
PyTrailerNode >> tokenVariables [
	^ #(#lparenToken #rparenToken #timesToken #timesTimesToken #lbrackToken #rbrackToken #periodToken #nameToken)
]
