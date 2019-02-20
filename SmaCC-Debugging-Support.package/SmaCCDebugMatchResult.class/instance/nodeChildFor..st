inspector
nodeChildFor: aNode
	^ (children
		detect: [ :each | each nodes identityIncludes: aNode ]
		ifNone: [ self class new
				parent: self;
				nodes: {aNode};
				yourself ]) matchedNodes detect: [ :each | each node == aNode ]