accessing
validate: aString forResult: aSmaCCRewriteResult
	| stream |
	self validationParserClass isNil ifTrue: [^self].
	stream := SmaCCLineNumberStream on: (ReadStream on: aString).
	[self validationParserClass parseStream: stream]
		on: SmaCCParserError
		do:
			[:ex | 
			| parser token |
			parser := ex tag.
			token := parser errorToken.
			token notNil
				ifTrue:
					[aSmaCCRewriteResult
						startLine: (stream lineNumberFor: token startPosition);
						startColumn: (stream columnNumberFor: token startPosition);
						interval: (token startPosition to: token stopPosition)].
			aSmaCCRewriteResult
				errorString: 'Validation error';
				type: #warning]