converting
asDFA
	| startNode |
	startNode := self asNFA.
	^startNode asDFA