private
performParsingStep
	| actions position token |
	(currentToken value = '>>' or: [ currentToken value = '>>>' ])
		ifTrue:
			[ actions := OrderedCollection new.
			self addActionsFor: scanner GREATER_THANId to: actions.
			actions notEmpty
				ifTrue:
					[ position := scanner position.
					token := currentToken.
					scanner
						position: scanner position - (currentToken value size - 1).
					currentToken := SmaCCToken
						value: '>'
						start: currentToken startPosition
						ids: (Array with: scanner GREATER_THANId).
					actions do: [ :each | self splitWithAction: each ].
					currentToken := token.
					scanner position: position ] ].
	^ super performParsingStep