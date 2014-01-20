SmaCCParserState represents a particular parse in a GLR parser.

Instance Variables:
	isAccepted	<Boolean>	has this parse been accepted
	nodeStack	<SequenceableCollection of: Object>	the stack of objects for this parse
	position	<Integer>	the current position of the scanner
	scannerState	<Symbol> the current state of the scanner
	stateStack	<SequenceableCollection of: Integer>	the stack of states for this parse

