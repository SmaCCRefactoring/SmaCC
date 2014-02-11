generated
block: aJavaSwitchBlockNode
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aJavaSwitchBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]