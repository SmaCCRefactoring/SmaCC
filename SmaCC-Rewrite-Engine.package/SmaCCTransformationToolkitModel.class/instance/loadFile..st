actions
loadFile: aString
	| stream |
	stream := FileStream readOnlyFileNamed: aString.
	[ self class compiler evaluate: stream contents for: self logged: false.
	self isModified: false ]
		ensure: [ stream close ]