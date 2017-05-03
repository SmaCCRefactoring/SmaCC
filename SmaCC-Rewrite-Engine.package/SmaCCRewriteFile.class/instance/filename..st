accessing
filename: aString
	filename := aString.
	timestamp := self currentFileTimestamp.
	self changed: #filename