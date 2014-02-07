generated
throws: aJavaThrowsNode
	self throws notNil ifTrue: [self throws parent: nil].
	throws := aJavaThrowsNode.
	self throws notNil ifTrue: [self throws parent: self]