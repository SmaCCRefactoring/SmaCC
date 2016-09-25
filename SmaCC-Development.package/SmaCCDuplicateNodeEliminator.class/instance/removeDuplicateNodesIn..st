algorithm
removeDuplicateNodesIn: aSmaCCNode
	root := aSmaCCNode.
	self removeDuplicates.
	self copyGraph.
	^ root