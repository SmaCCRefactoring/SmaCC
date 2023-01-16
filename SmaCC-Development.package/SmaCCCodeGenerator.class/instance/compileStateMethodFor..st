compiling-scanner
compileStateMethodFor: aCollection

	self
		startPublicOverrideMethod;
		nextPutLine: (self method: #states type: self arrayType);
		nextPutStatement: (self return: aCollection asArray printString);
		endMethod.
	self compileMethodIn: scannerClass classSide