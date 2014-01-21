edges
setTransitionsOn: aSmaCCNode to: edgeCollection 
	aSmaCCNode transitions: (edgeCollection reject: [:each | each isEmpty]).
	aSmaCCNode transitions do: [:each | each to: (self convertToDFA: each to)]