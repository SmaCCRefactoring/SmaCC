SmaCCGrammarCompiler compiles a SmaCCGrammar.

Instance Variables:
	actions	<Array>	the action table for the parser. It contains the action (shift/reduce/accept/reject) for each possible state/symbol pair
	grammar	<SmaCCGrammar>	our grammar
	itemSets	<SequenceableCollection of: SmaCCItemSet>	the item sets for our grammar
	model	<RBNameSpace>	where we are compiling our changes into
	parserClass	<RBAbstractClass>	the parser class for our changes
	parserDefinitionString	<String>	the definition of our parser
	scannerCompiler	<SmaCCScannerCompiler>	a compiler for the scanner
	shiftTable	<Dictionary key: (Array with: Integer with: SmaCCSymbol) value: Integer>	a table mapping a state/symbol pair to the new state that is aquired by shifting the symbol
	startingStateMap	<Dictionary key: SmaCCSymbol value: Integer>	the state for SmaCCSymbol's starting item set

