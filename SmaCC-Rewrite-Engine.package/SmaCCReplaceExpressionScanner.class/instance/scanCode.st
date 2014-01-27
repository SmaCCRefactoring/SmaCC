private
scanCode
	outputStream reset.
	[outputStream nextPutAll: (stream upTo: $`).
	stream peek == $`
		ifTrue:
			[self isValidCode
				ifTrue:
					[stream skip: -1.
					state := #default.
					^self recordAndReportMatch: (Array with: self codeExpressionId)]].
	stream atEnd ifTrue: [^self reportLastMatch].
	outputStream nextPut: $`] repeat