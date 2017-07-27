private
performActionsForCurrentToken
	"This method will loop as long as it reduces, and only return after a shift, signaling a need to fetch a new token."

	| action |
	[ currentToken notNil ]
		whileTrue: [ action := self actionForCurrentToken.
			action = self acceptAction
				ifTrue: [ ^ true ].
			self performAction: action ].
	^ false