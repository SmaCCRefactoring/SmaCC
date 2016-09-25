private
setStartingStatesIfNone
	states isEmpty
		ifTrue:
			[ states add: self initialParserState ]