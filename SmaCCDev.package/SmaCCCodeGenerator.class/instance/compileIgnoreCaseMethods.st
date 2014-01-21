compiling
compileIgnoreCaseMethods
	self grammar ignoreCase ifFalse: [^self].
	self
		startPublicOverrideMethod;
		nextPutLine:
				(self
						method: #keywordFor:
						type: self stringType
						argumentName: 'aString'
						argumentType: self stringType);
		nextPutStatement: (self return: (self uppercaseString: 'aString'));
		endMethod;
		compileMethodIn: scannerClass