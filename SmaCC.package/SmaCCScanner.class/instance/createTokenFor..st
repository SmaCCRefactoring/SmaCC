private
createTokenFor: string 
	| token |
	token := self tokenClass 
				value: string
				start: start + 1
				id: matchActions.
	outputStream reset.
	^token