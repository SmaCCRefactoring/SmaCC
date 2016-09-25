generated
block: aSwiftBlockNode
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aSwiftBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]