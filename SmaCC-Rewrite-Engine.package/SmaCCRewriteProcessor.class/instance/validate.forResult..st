accessing
validate: aString forResult: aSmaCCRewriteResult
	| stream |
	self validationParserClass isNil
		ifTrue: [ ^ self ].
	stream := SmaCCLineNumberStream on: (ReadStream on: aString).
	[ self validationParserClass parseStream: stream ]
		on: SmaCCParserError
		do: [ :ex | 
			| parser token |
			parser := ex tag.
			token := parser errorToken.
			token notNil
				ifTrue: [ 
					aSmaCCRewriteResult
						startLine: (stream lineNumberFor: (token startPosition ifNil: [ 1 ]));
						startColumn: (stream columnNumberFor: (token startPosition ifNil: [ 1 ]));
						interval: ((token startPosition ifNil: [ 1 ]) to: (token stopPosition ifNil: [ 1 ])) ].
			aSmaCCRewriteResult
				errorString: 'Validation error';
				type: #warning ]