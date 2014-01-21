compiling
compileDefinitionComment: aString
	self
		startPublicVirtualMethod;
		nextPutLine: (self method: #definitionComment type: self voidType);
		nextPutLine: (self comment: aString);
		endMethod.
	self compileMethodWithoutFormattingIn: parserClass metaclass