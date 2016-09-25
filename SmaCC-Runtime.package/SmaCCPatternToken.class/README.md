SmaCCPatternToken is a token for pattern nodes.

Instance Variables:
	isList	<Boolean>	do we match collections or single objects
	isNode	<Boolean>	can we match other parse nodes
	isToken	<Boolean>	can we match other tokens
	nodeClassName	<Symbol>	when matching a parse node, limit it to these types of nodes
	testBlock	<BlockClosure>	after a match, run some code that tests the match

