"
I hold a scanner state when the parser forks.

Equivalence between scanner states is used to determine if a pre-existing token can be reused in another thread of the parser (hence the custom = definition)
"
Class {
	#name : #SmaCCScannerState,
	#superclass : #Object,
	#instVars : [
		'position',
		'state'
	],
	#category : 'SmaCC-GLR-Runtime'
}

{ #category : #'instance creation' }
SmaCCScannerState class >> position: anInteger state: aSymbol [
	^ self new
		position: anInteger;
		state: aSymbol;
		yourself
]

{ #category : #comparing }
SmaCCScannerState >> = anObject [
	^ self class = anObject class
		and: [ self position = anObject position
				and: [ self state = anObject state ] ]
]

{ #category : #comparing }
SmaCCScannerState >> hash [
	^ self position hash hashMultiply bitXor: self state hash
]

{ #category : #accessing }
SmaCCScannerState >> position [
	^ position
]

{ #category : #accessing }
SmaCCScannerState >> position: anObject [
	position := anObject
]

{ #category : #accessing }
SmaCCScannerState >> state [
	^ state
]

{ #category : #accessing }
SmaCCScannerState >> state: anObject [
	state := anObject
]
