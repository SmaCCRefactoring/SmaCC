SmaCCRHS represents the right hand side of the production.

Instance variables:
	collection	<OrderedCollection of: SmaCCSymbol> the collection of symbols that represent the rhs
	grammar <SmaCCGrammar> the grammar that the production is in
	variableNames	<Dictionary key: String value: Integer>	the name of each symbol in the rhs. These names can be used in the {} code blocks.