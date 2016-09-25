compiling-scanner
compileIgnoreCaseMethods
	super compileIgnoreCaseMethods.
	self grammar ignoreCase
		ifFalse: [ ^ self ].
	scannerClass
		compile:
			'tokenClass
	^SmaCCCaseInsensitiveToken'
		classified: #generated