converting
asNFA
	| startNode |
	startNode := SmaCCNode new.
	self asNFAStartingWith: startNode.
	^ startNode