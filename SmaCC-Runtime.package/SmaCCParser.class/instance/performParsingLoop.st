private
performParsingLoop
	| action |
	[ self getNextToken.
	action := self actionForCurrentToken.
	action = self acceptAction ]
		whileFalse: [ self performAction: action ].
	self checkForErrors