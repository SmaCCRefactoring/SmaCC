testing
matches: aString
	| stream |
	stream := WriteStream on: String new.
	self localSaveOn: stream.
	^ '*' , aString , '*' match: stream contents