converting
asDFA
	| startNode |
	startNode := SmaCCNode new.
	self asNFAStartingWith: startNode.
	^startNode asDFA