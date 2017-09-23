accessing
currentToken
	"My current token, using info I have as a parser."

	^ self object currentToken
		ifNotNil: [ :aToken | AltSmaCCTokenDescription on: aToken in: self object ]