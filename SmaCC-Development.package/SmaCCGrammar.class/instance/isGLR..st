initialize-release
isGLR: aBoolean
	isGLR := aBoolean.
	isGLR
		ifTrue: [ parserType := SmaCCGLRParser parserType ]