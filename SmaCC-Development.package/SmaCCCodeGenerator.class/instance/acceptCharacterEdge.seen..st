compiling-scanner
acceptCharacterEdge: aSmaCCCharacterEdge seen: aCollection
	| stream |
	stream := WriteStream with: String new.
	aSmaCCCharacterEdge transitionObjects size + aCollection size
		> SmaCCGrammar maximumCharacterValue
		ifTrue: [ ^ self trueValue ].
	stream nextPut: $(.
	aSmaCCCharacterEdge transitionObjects size
		= SmaCCGrammar maximumCharacterValue
		ifTrue: [ self
				outputInvertedMatchFor: aSmaCCCharacterEdge
				on: stream ]
		ifFalse:
			[ self
				outputMatchFor: aSmaCCCharacterEdge
				seen: aCollection
				on: stream ].
	stream nextPut: $).
	^ stream contents