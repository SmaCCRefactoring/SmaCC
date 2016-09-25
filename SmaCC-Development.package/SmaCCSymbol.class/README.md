SmaCCSymbol is an abstract class that represents a symbol in our grammar. Symbols can be either terminal or non-terminal. Terminal symbols are mapped to tokens in the grammar and non-terminals are made up of other symbols.

Subclasses must implement the following messages:
	accessing
		calculateFirstTerminals
	testing
		isTerminal

Instance Variables
	firstTerminals	<Set of: SmaCCTerminalSymbol>	the first terminal symbol that this can produce
	name	<String>	the name of the symbol
	precedence	<Integer>	the precedence for the symbol used for shift/reduce conflicts
