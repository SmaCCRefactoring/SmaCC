"
I represent a reduce action
"
Class {
	#name : #SmaCCRReduce,
	#superclass : #SmaCCRTransition,
	#category : 'SmaCC-Development-Debug'
}

{ #category : #'instance creation' }
SmaCCRReduce class >> forAction: anAction [
	^ (anAction bitAnd: 2r11) = 2r10
]

{ #category : #'instance creation' }
SmaCCRReduce class >> on: anAction for: aSymbol in: aTable [
	^ self new
		state: anAction >> 2;
		symbol: aSymbol;
		table: aTable
]

{ #category : #printing }
SmaCCRReduce >> printFollowUpSymbol [
	^ table symbols at: (table reduces at: state) first
]

{ #category : #printing }
SmaCCRReduce >> printNbElements [
	^ (table reduces at: state) second printString
]

{ #category : #printing }
SmaCCRReduce >> printOn: aStream [
	aStream
		nextPutAll:
			'<' , ((state << 2) + 2r10) printString , ':Reduce on: '
				, self printSymbol , ' pop: ' , self printNbElements
				, ' and goto (stack, ' , self printFollowUpSymbol , ' )'
]

{ #category : #printing }
SmaCCRReduce >> printSymbol [
	^ table symbols at: symbol
]
