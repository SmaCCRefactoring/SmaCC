nodes
mergeActionsFrom: nodeCollection into: aSmaCCNode
	nodeCollection do: [ :each | aSmaCCNode addActions: each action ]