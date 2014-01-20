accessing
parse
	self setDefaultStartingStateIfNone.
	self performParsingLoop.
	^nodeStack last