actions
loadFile: aString
	| stream |
	stream := FileStream readOnlyFileNamed: aString.
	[ Compiler evaluate: stream contents for: self logged: false.
	self isModified: false ]
		ensure: [ stream close ]