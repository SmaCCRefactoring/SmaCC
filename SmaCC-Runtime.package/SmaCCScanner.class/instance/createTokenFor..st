private
createTokenFor: string
	| token |
	token := self tokenClass
		value: string
		start: start + 1
		ids: matchActions.
	outputStream reset.
	^ token