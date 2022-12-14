"
I represent a shift action
"
Class {
	#name : #SmaCCRShift,
	#superclass : #SmaCCRTransition,
	#category : 'SmaCC-Development-Debug'
}

{ #category : #'instance creation' }
SmaCCRShift class >> forAction: anAction [
	^ (anAction bitAnd: 2r11) = 2r01
]

{ #category : #'instance creation' }
SmaCCRShift class >> on: anAction for: aSymbol in: aTable [
	^ self new
		state: anAction >> 2;
		symbol: aSymbol;
		table: aTable
]

{ #category : #printing }
SmaCCRShift >> printOn: aStream [
	aStream
		nextPutAll:
			'<' , ((state << 2) + 2r01) printString , ':Shift on: '
				, self printSymbol , ' to: ' , state printString , '>'
]

{ #category : #printing }
SmaCCRShift >> printSymbol [
	^ table symbols at: symbol
]
