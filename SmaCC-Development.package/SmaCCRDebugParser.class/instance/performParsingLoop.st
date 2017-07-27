private
performParsingLoop
	[ self getNextToken.
	self performActionsForCurrentToken ] whileFalse.
	self checkForErrors