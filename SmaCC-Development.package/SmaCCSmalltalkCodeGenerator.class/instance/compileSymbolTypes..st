compiling-parser
compileSymbolTypes: anArray
	self
		startPublicVirtualMethod;
		nextPutLine: (self method: 'symbolTypes' type: self arrayType);
		nextPutStatement: (self return: anArray storeString);
		endMethod;
		compileMethodIn: self parserClass