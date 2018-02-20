testing
isEOFToken
	^ currentToken notNil
		and: [ currentToken ids first = self emptySymbolTokenId ]