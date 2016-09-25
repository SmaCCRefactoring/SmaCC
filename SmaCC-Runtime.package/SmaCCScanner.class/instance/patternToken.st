private
patternToken
	| token |
	token := SmaCCPatternToken
		value: outputStream contents
		start: start + 1
		ids: matchActions.
	outputStream reset.
	^ token