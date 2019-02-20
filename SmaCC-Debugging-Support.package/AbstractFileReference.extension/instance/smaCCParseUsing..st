*smacc-debugging-support
smaCCParseUsing: parserClass
	| contents |
	self
		readStreamDo: [ :str | 
			parserClass setEncodingOn: str.
			contents := str contents ].
	^ parserClass parse: contents