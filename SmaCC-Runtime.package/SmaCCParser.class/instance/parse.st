accessing
parse
	| result |
	self setDefaultStartingStateIfNone.
	self performParsingLoop.
	result := nodeStack last.
	(result respondsTo: #comments:)
		ifTrue: [ result comments: scanner comments ].
	^ result