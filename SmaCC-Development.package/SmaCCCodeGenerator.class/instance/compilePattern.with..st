compiling-scanner
compilePattern: aString with: bString
	self 
		startPublicOverrideMethod;
		nextPutLine: (self method: ('pattern', aString) asSymbol type: self voidType);
		nextPutStatement: (self return: bString printString);
		endMethod.
	self compileMethodIn: scannerClass theMetaClass