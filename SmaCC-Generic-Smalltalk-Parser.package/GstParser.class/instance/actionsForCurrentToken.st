public
actionsForCurrentToken
	| actions |
	actions := super actionsForCurrentToken.
	actions isEmpty
		ifTrue:
			[ (currentToken ids includes: scanner binaryId)
				ifTrue:
					[ currentToken value = '|'
						ifTrue: [ self addActionsFor: scanner binaryId to: actions ]
						ifFalse:
							[ (#('||' '|||') includes: currentToken value)
								ifTrue:
									[ currentToken := currentToken class
										value: '|'
										start: currentToken startPosition
										ids: (Array with: scanner barId).
									self position: currentToken startPosition.
									actions := super actionsForCurrentToken ] ] ] ].
	^ actions