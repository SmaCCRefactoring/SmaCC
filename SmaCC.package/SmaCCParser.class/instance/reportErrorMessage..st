private-error handling
reportErrorMessage: aString 
	SmaCCParserError new 
		tag: self;
		signal: aString