Class {
	#name : #PyVarArgListNode,
	#superclass : #PyRootNode,
	#instVars : [
		'args',
		'inits',
		'commaTokens',
		'timesToken',
		'sname',
		'timesTimesToken',
		'ssname'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyVarArgListNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitVarArgList: self
]

{ #category : #generated }
PyVarArgListNode >> args [
	^ args
]

{ #category : #generated }
PyVarArgListNode >> args: anOrderedCollection [
	self setParents: self args to: nil.
	args := anOrderedCollection.
	self setParents: self args to: self
]

{ #category : #generated }
PyVarArgListNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyVarArgListNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyVarArgListNode >> compositeNodeVariables [
	^ #(#args #inits)
]

{ #category : #generated }
PyVarArgListNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
PyVarArgListNode >> initialize [
	super initialize.
	args := OrderedCollection new: 2.
	inits := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyVarArgListNode >> inits [
	^ inits
]

{ #category : #generated }
PyVarArgListNode >> inits: anOrderedCollection [
	self setParents: self inits to: nil.
	inits := anOrderedCollection.
	self setParents: self inits to: self
]

{ #category : #generated }
PyVarArgListNode >> sname [
	^ sname
]

{ #category : #generated }
PyVarArgListNode >> sname: aSmaCCToken [
	sname := aSmaCCToken
]

{ #category : #generated }
PyVarArgListNode >> ssname [
	^ ssname
]

{ #category : #generated }
PyVarArgListNode >> ssname: aSmaCCToken [
	ssname := aSmaCCToken
]

{ #category : #generated }
PyVarArgListNode >> timesTimesToken [
	^ timesTimesToken
]

{ #category : #generated }
PyVarArgListNode >> timesTimesToken: aSmaCCToken [
	timesTimesToken := aSmaCCToken
]

{ #category : #generated }
PyVarArgListNode >> timesToken [
	^ timesToken
]

{ #category : #generated }
PyVarArgListNode >> timesToken: aSmaCCToken [
	timesToken := aSmaCCToken
]

{ #category : #generated }
PyVarArgListNode >> tokenVariables [
	^ #(#timesToken #sname #timesTimesToken #ssname)
]
