generated
declaration: aSwiftParseNode
	self declaration notNil
		ifTrue: [ self declaration parent: nil ].
	declaration := aSwiftParseNode.
	self declaration notNil
		ifTrue: [ self declaration parent: self ]