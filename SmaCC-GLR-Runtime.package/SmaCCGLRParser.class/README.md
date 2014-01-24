SmaCCGLRParser is an abstract superclass for all GLR generated parsers in SmaCC.

Instance Variables:
	currentState	<SmaCCParserState>	the current parse that we are trying
	lastPosition	<Integer>	the starting location of the scanner before calling getNextToken
	lastState	<Symbol>	the state of the scanner before calling getNextToken
	lastToken	<SmaCCToken>	the token returned from getNextToken (if the lastState and lastToken are the same as the current token, then this value is returned without scanning anything)
	nextScannerPosition	<Integer>	the ending location of the scanner after calling getNextToken
	nextScannerState	<Symbol>	the ending state of the scanner after calling getNextToken
	parseAll	<Boolean>	should we return a collection of all potential parses or just one
	states	<SequenceableCollection of: SmaCCParserState>	the current list of valid parses
	tryAllStates	<Boolean>	should we try to parse starting from any state instead of the starting state
