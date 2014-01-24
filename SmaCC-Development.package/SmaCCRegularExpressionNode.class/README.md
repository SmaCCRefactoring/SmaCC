SmaCCRegularExpressionNode is an abstract class that is used during the construction of the scanner. When the scanner definition is parsed, it creates the SmaCCRegularExpressionNode objects. These objects are then converted to an NFA graph that is converted to a DFA that is compiled.

Subclasses must implement the following messages:
	accessing
		possibleMatchesSize
	private
		asNFAStartingWith:
		possibleMatchesDo:on:

Instance Variables:
	action	<Object>	this is a symbol that is performed on the scanner, an integer for the token id, or nil if we can't accept a token at this position
	position	<Integer>	the position in the scanner definition for this RE -- this is only used for overlapping tokens. Tokens that are defined earlier in the definition are preferred over later ones (except for those used in the parser's definition)
	states	<Collection of: Symbol>	the states where this RE is valid
