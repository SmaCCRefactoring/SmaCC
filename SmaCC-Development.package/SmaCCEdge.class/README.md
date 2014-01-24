SmaCCEdge is an edge in the DFA/NFA for the scanner. It contains the objects (characters or symbols) that we transition on and the node we transition to.

Subclasses must implement the following messages:
	private
		dispatchTo:seen:

Instance Variables:
	toNode	<SmaCCNode>	the next node in the graph
	transitionObjects	<Collection of: (Character | Symbol))>	the characters or states that we transition on

