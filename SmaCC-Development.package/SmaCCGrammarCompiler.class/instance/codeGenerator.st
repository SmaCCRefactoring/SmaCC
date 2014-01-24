accessing
codeGenerator
	^codeGenerator ifNil: [self codeGenerator: SmaCCSmalltalkCodeGenerator new]