compiling-parser
compileSymbolNames: anArray
	self
		startPublicVirtualMethod;
		nextPutLine: (self method: 'symbolNames' type: self arrayType);
		nextPutStatement: (self return: anArray storeString);
		endMethod;
		compileMethodIn: self parserClass