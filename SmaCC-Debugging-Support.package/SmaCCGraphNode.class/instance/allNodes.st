accessing
allNodes
	| nodes |
	nodes := IdentitySet new.
	self allNodesInto: nodes.
	^ nodes