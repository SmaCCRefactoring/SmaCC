nodes
createMergedNodeFrom: nodeCollection
	| newNode |
	newNode := SmaCCNode new.
	self mergeTransitionsFrom: nodeCollection into: newNode.
	self mergeActionsFrom: nodeCollection into: newNode.
	^newNode