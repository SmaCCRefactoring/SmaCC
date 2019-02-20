accessing
nodes: aCollection
	matchedNodes := aCollection collect: [ :each | SmaCCDebugMatchedNode forResult: self andNode: each ]