private
generateImplicitToken: aSmaCCToken
	^ (SmaCCGrammar implicitToken: aSmaCCToken value)
		ifNil: [ SmaCCParserError new
				messageText: 'Undefined token ' , aSmaCCToken value;
				tag: aSmaCCToken;
				signal ]