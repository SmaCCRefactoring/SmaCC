SmaCCGrammar represents a LR(1) or a LALR(1) grammar.

Instance Variables:
	otherStartingSymbols	<Collection of: SmaCCSymbol>	other starting productions. The first production in the grammar is the defaulting starting position, but this can list other starting positions.
	shiftReduceTable	<Dictionary key: SmaCCSymbol value: SmaCCAction class>	when we have a shift/reduce conflict how should we handle it. This table contains the left/right associative rules. Left is a reduce action and right is a shift action.
	symbols	<OrderedCollection of: SmaCCSymbol>	all symbols in our grammar -- includes both terminal and non-terminal
	tokens	<Dictionary key: String value: SmaCCRegularExpressionNode>	the tokens for our scanner
	type	<Symbol>	the type of grammar (LALR1 or LR1)

