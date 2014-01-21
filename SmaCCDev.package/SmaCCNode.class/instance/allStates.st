accessing
allStates
	| nodes |
	nodes := Set new.
	self allStatesInto: nodes.
	^nodes