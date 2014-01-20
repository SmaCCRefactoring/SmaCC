nodes
mergeTransitionsFrom: nodeCollection into: aSmaCCNode 
	| transitions |
	transitions := Set new.
	nodeCollection 
		do: [:each | each transitions do: [:edge | transitions add: edge copy]].
	aSmaCCNode transitions: transitions.
	aSmaCCNode mergeTransitions