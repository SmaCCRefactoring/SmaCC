"
I represent an error in the parser
"
Class {
	#name : #SmaCCRError,
	#superclass : #SmaCCRTransition,
	#category : 'SmaCC-Development-Debug'
}

{ #category : #'instance creation' }
SmaCCRError class >> forAction: anAction [
	^ (anAction bitAnd: 2r11) = 2r11
]

{ #category : #'instance creation' }
SmaCCRError class >> on: anAction for: aSymbol in: aTable [
	^ self new
		symbol: aSymbol;
		table: aTable
]
