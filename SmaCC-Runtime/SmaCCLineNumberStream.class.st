"
SmaCCLineNumberStream is a wrapper for streams that calculates line numbers.

Instance Variables:
	eolPositions	<OrderedCollection of: Integer>	the positions of each end of line
	lastPosition	<Integer>	the position of the last character that we have calculated the end of line information for (we know the line number for all characters before this position and don't know anything about the characters after this position)
	previousWasCR	<Boolean>	was the previous character a CR. This is used for CR LF streams. A CR LF combination should only increment the line counter by 1
	sourceStream	<Stream>	the stream that we are wrapping

"
Class {
	#name : #SmaCCLineNumberStream,
	#superclass : #Stream,
	#instVars : [
		'sourceStream',
		'previousWasCR',
		'eolPositions',
		'lastPosition'
	],
	#category : 'SmaCC-Runtime'
}

{ #category : #'instance creation' }
SmaCCLineNumberStream class >> on: aReadStream [
	^ self basicNew
		on: aReadStream;
		yourself
]

{ #category : #testing }
SmaCCLineNumberStream >> atEnd [
	^ sourceStream atEnd
]

{ #category : #accessing }
SmaCCLineNumberStream >> columnNumber [
	^ self columnNumberFor: self position
]

{ #category : #accessing }
SmaCCLineNumberStream >> columnNumberFor: anInteger [
	^ anInteger - (eolPositions at: (self lineNumberFor: anInteger))
]

{ #category : #accessing }
SmaCCLineNumberStream >> contents [
	^ sourceStream contents
]

{ #category : #private }
SmaCCLineNumberStream >> contentsSpecies [
	^ sourceStream contentsSpecies
]

{ #category : #'error handling' }
SmaCCLineNumberStream >> doesNotUnderstand: aMessage [
	^ [ sourceStream
		perform: aMessage selector
		withArguments: aMessage arguments ]
		ensure: [ self position: sourceStream position ]
]

{ #category : #accessing }
SmaCCLineNumberStream >> explore: aBlock [
	"evaluate aBlock with this stream as argument.  When done, reset my position to the current position."
	
	| savedPosition |
	savedPosition := self position.
	[ ^ aBlock value: self ] ensure: [ self position: savedPosition ]
]

{ #category : #accessing }
SmaCCLineNumberStream >> flush [
	^ sourceStream flush
]

{ #category : #testing }
SmaCCLineNumberStream >> isReadable [
	^ sourceStream isReadable
]

{ #category : #testing }
SmaCCLineNumberStream >> isWritable [
	^ sourceStream isWritable
]

{ #category : #accessing }
SmaCCLineNumberStream >> lineAndCol [
	"answers the line and column position as a point."
	^ self lineAndColFor: self position
]

{ #category : #accessing }
SmaCCLineNumberStream >> lineAndColFor: anIntegerPosition [
	"answers the line and column position as a point."
	| ln col |
	ln := self lineNumberFor: anIntegerPosition.
	col := anIntegerPosition - (eolPositions at: ln).
	" it is not correct to add 1 here; if the newline is at position 7 and the current position is 8
	then we are at column 1."
	^ ln @ col
]

{ #category : #accessing }
SmaCCLineNumberStream >> lineNumber [
	^ self lineNumberFor: self position
]

{ #category : #accessing }
SmaCCLineNumberStream >> lineNumberFor: anInteger [
	| index start stop pos |
	pos := anInteger.
	pos >= eolPositions last
		ifTrue: [ ^ eolPositions size ].
	start := 1.
	stop := eolPositions size.
	[ start + 1 < stop ]
		whileTrue:
			[ index := (start + stop) // 2.
			(eolPositions at: index) <= pos
				ifTrue: [ start := index ]
				ifFalse: [ stop := index ] ].
	^ start
]

{ #category : #accessing }
SmaCCLineNumberStream >> next [
	| character streamPosition |
	character := sourceStream next.
	streamPosition := sourceStream position.
	streamPosition - 1 >= lastPosition
		ifTrue:
			[ lastPosition := streamPosition.
			character == Character cr
				ifTrue: [ eolPositions add: lastPosition.
					previousWasCR := true ]
				ifFalse:
					[ character == Character lf
						ifTrue:
							[ previousWasCR
								ifTrue: [ eolPositions at: eolPositions size put: lastPosition ]
								ifFalse: [ eolPositions add: lastPosition ] ].
					previousWasCR := false ] ].
	^ character
]

{ #category : #accessing }
SmaCCLineNumberStream >> nextPut: anObject [
	^ sourceStream nextPut: anObject
]

{ #category : #'initialize-release' }
SmaCCLineNumberStream >> on: aReadStream [
	sourceStream := aReadStream.
	eolPositions := OrderedCollection with: aReadStream position.
	lastPosition := aReadStream position.
	previousWasCR := false
]

{ #category : #accessing }
SmaCCLineNumberStream >> peek [
	^ sourceStream peek
]

{ #category : #accessing }
SmaCCLineNumberStream >> position [
	^ sourceStream position
]

{ #category : #accessing }
SmaCCLineNumberStream >> position: anInteger [
	anInteger > lastPosition
		ifTrue:
			[ sourceStream position: lastPosition.
			[ sourceStream position < anInteger and: [ sourceStream atEnd not ] ]
				whileTrue: [ self next ] ]
		ifFalse: [ sourceStream position: anInteger ]
]

{ #category : #printing }
SmaCCLineNumberStream >> printOn: aStream [
	| contents |
	(sourceStream collectionSpecies isKindOf: String class)
		ifFalse: [ ^ super printOn: aStream ].
	contents := sourceStream contents.
	aStream
		nextPutAll: self className;
		nextPutAll: ' "';
		nextPutAll: (contents copyFrom: 1 to: sourceStream position);
		nextPutAll: '·';
		nextPutAll: (contents copyFrom: sourceStream position + 1 to: contents size);
		nextPutAll: '"'
]

{ #category : #accessing }
SmaCCLineNumberStream >> size [
	"The number of elemenst in this stream"
	"override the method inherited from Object"
	^ sourceStream size
]

{ #category : #accessing }
SmaCCLineNumberStream >> skip: anInteger [
	^ self position: self position + anInteger
]
