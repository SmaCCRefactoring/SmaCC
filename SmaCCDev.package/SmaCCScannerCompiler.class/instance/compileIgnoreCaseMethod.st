compiling-scanner
compileIgnoreCaseMethod
	SmaCCGrammar ignoreCase 
		ifTrue: 
			[scannerClass compile: 'keywordFor: aString 
	^aString asUppercase'
				classified: #'generated-scanner']