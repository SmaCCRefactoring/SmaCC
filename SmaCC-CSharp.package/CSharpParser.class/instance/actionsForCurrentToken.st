private
actionsForCurrentToken
	| actions |
	actions := super actionsForCurrentToken.
	(actions isEmpty and: [ currentToken ids includes: scanner gtgtId ])
		ifTrue:
			[ currentToken := currentToken class
				value: '>'
				start: currentToken startPosition
				ids: (Array with: scanner gtId).
			self position: currentToken startPosition.
			actions := super actionsForCurrentToken ].
	^ actions