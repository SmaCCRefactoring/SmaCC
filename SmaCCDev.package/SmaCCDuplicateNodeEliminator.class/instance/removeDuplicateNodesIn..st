algorithm
removeDuplicateNodesIn: aSmaCCNode 
	root := aSmaCCNode.
	self removeDuplicates.
	^root