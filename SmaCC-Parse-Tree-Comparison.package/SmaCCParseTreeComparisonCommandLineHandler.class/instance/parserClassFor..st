public
parserClassFor: aString
	^ SmaCCParser allSubclasses
		detect: [ :each | each fileExtension = ('.' , aString) ]
		ifNone: [ self exitFailure: 'Cannot find parser for file type: ' , aString ]