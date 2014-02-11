generated
block: aJavaBlockNode
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aJavaBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]