SmaCCRegularExpressionNode represents a regular expression. The scanner is represented by a regular expression. These are the initial objects created in producing the scanner. From these nodes, we create a directed graph and then we compile the graph.

Subclasses must implement the following messages:
	accessing
		possibleMatchesSize
	private
		asNFAStartingWith:
		possibleMatchesDo:on:

Instance Variables:
	action	<SequenceableCollection>	the actions to be performed when we find a match
	position	<Integer>	the position of the RE in the scanner. If we have multiple matches, we prefer the ones listed first.