accessing
parserType
	^ parserType ifNil: [ parserType := SmaCCParser parserType ]