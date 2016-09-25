error handling
reportErrorMessage: aString
	SmaCCParserError new
		messageText: aString;
		tag: self;
		signal