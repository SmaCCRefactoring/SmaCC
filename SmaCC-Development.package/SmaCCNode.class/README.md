SmaCCNode is a node in a directed graph.

Instance Variables:
	action	<SequenceableCollection>	a collection of integers or a symbol. This contains the action to be performed when we match and can't find a longer match.
	id	<Integer>	a unique number that allows us to sort the nodes
	transitions	<Collection of: SmaCCEdge>	our transitions

