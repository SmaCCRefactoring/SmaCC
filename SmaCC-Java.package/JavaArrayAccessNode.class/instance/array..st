generated
array: aJavaExpressionNode
	self array notNil
		ifTrue: [ self array parent: nil ].
	array := aJavaExpressionNode.
	self array notNil
		ifTrue: [ self array parent: self ]