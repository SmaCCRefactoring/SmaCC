generated
type: aSwiftParseNode
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aSwiftParseNode.
	self type notNil
		ifTrue: [ self type parent: self ]