*SmaCC-Debugging-Support
filesWithParserErrorsIn: aDirectory
	^ (self sourceFilesIn: aDirectory)
		select: [ :each | 
			[ self parseFile: each.
			false ]
				on: Error
				do: [ :ex | ex return: true ] ]