inspector
patternChildFor: aNode
	^ children
		detect: [ :each | each patternNode == aNode ]
		ifNone: [ self class new
				parent: self;
				patternNode: aNode;
				yourself ]