printing
displayString
	| stream |
	stream := WriteStream on: String new.
	self displayOn: stream.
	^stream contents