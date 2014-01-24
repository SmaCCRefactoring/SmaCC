SmaCCSymbol is an abstract class that represents a symbol in the grammar.

Subclasses must implement the following messages:
	accessing
		calculateFirstTerminals
	testing
		isTerminal

Instance Variables:
	firstItems	<Collection of: SmaCCTerminalSymbol>	the first terminals that can be produced from us
	name	<String>	our name
	precedence	<Integer>	our precedence (in case of shift/reduce conflicts)

