compiling-scanner
compileTokenIdMethodNamed: aString withId: symbolId
	self
		startPublicOverrideMethod;
		nextPutLine: (self method: aString , 'Id' type: self unsignedShort);
		nextPutStatement: (self return: symbolId printString);
		endMethod;
		compileMethodIn: scannerClass