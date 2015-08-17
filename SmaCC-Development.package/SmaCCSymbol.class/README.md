SmaCCSymbol is an abstract class that represents a symbol in the grammar.

Subclasses must implement the following messages:
	accessing
		calculateFirstTerminals
	testing
		isTerminal

Instance Variables:
	firstTerminals	<Set of: SmaCCTerminalSymbol>	the first terminal symbol that this can produce
	name	<String>		the name of the symbol
	precedence	<Integer>	our precedence (in case of shift/reduce conflicts)

