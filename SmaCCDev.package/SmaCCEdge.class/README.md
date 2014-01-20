SmaCCEdge represents a transition in a Finite Automata (directed graph). It is labeled with the characters or states (possibly none, indicating an epsilon transition) that cause the transition.

Instance Variables:
	toNode	<SmaCCNode>	The node that this is transitioning to.
	transitionObjects	<SortedCollection of: (Character | Symbol)>	The characters or symbols that cause the transition. Note that there are no duplicates and all characters/symbols are sorted.