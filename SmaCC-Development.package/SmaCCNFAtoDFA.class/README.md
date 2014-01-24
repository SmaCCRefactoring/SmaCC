SmaCCNFAtoDFAAlgorithm converts an NFA without epsilon transitions into a DFA. If a node contains edges that lead to multiple nodes for the same character, then a new state is created that merges all states for the given character. 

Instance Variables:
	mergedStates	<Dictionary>	dictionary that maps a collection of states to the resulting merged state
