compiling
compileErroneousDefinitionComment: aString
	self
		startPublicVirtualMethod;
		nextPutLine: (self method: #erroneousDefinitionComment type: self voidType);
		nextPutLine: (self comment: aString);
		endMethod.
	self compileMethodWithoutFormattingIn: parserClass theMetaClass