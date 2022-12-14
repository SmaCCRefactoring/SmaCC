"
I represent a transition action
"
Class {
	#name : #SmaCCRTransition,
	#superclass : #Object,
	#instVars : [
		'symbol',
		'state',
		'table'
	],
	#category : 'SmaCC-Development-Debug'
}

{ #category : #'instance creation' }
SmaCCRTransition class >> onAction: anAction for: aSymbol in: aTable [
	self allSubclasses
		do: [ :c | 
			(c forAction: anAction)
				ifTrue: [ ^ c on: anAction for: aSymbol in: aTable ] ].
	self error: 'Unhandled action'
]

{ #category : #accessing }
SmaCCRTransition >> state [
	^ state
]

{ #category : #accessing }
SmaCCRTransition >> state: anObject [
	state := anObject
]

{ #category : #accessing }
SmaCCRTransition >> symbol [
	^ symbol
]

{ #category : #accessing }
SmaCCRTransition >> symbol: anObject [
	symbol := anObject
]

{ #category : #accessing }
SmaCCRTransition >> table [
	^ table
]

{ #category : #accessing }
SmaCCRTransition >> table: anObject [
	table := anObject
]
