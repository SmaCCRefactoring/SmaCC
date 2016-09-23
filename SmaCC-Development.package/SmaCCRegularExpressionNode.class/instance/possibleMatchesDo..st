accessing
possibleMatchesDo: aBlock
	| stream |
	stream := WriteStream with: String new.
	self possibleMatchesDo: [ aBlock value: stream contents ] on: stream