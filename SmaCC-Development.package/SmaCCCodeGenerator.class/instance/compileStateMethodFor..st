compiling-scanner
compileStateMethodFor: aCollection
	self 
		startPublicOverrideMethod;
		nextPutLine: (self method: #states type: self voidType);
		nextPutStatement: (self return: aCollection asArray printString);
		endMethod.
	self compileMethodIn: scannerClass theMetaClass