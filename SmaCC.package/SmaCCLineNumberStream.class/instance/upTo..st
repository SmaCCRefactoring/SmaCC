accessing
upTo: aCharacter 
	| stream char |
	stream := WriteStream on: String new.
	[self atEnd or: [ (char := self next) = aCharacter]] 
		whileFalse: [stream nextPut: char].
	^ stream contents