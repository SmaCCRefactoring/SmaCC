accessing
parserClass: aClassOrString
	grammar isGLR
		ifTrue: [self codeGenerator glrParserClass: aClassOrString]
		ifFalse: [self codeGenerator parserClass: aClassOrString]