"
I represent an accept
"
Class {
	#name : #SmaCCRAccept,
	#superclass : #SmaCCRTransition,
	#category : 'SmaCC-Development-Debug'
}

{ #category : #'instance creation' }
SmaCCRAccept class >> forAction: anAction [
	^ (anAction bitAnd: 2r11) = 2r00
]

{ #category : #'instance creation' }
SmaCCRAccept class >> on: anAction for: aSymbol in: aTable [
	^ self new
		symbol: aSymbol;
		table: aTable
]

{ #category : #printing }
SmaCCRAccept >> printOn: aStream [
	aStream nextPutAll: '<0:Accept on: ' , self printSymbol , '>'
]

{ #category : #printing }
SmaCCRAccept >> printSymbol [
	^ table symbols at: symbol
]
