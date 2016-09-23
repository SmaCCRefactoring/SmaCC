generated
message: aGstMessageNode
	self message notNil
		ifTrue: [ self message parent: nil ].
	message := aGstMessageNode.
	self message notNil
		ifTrue: [ self message parent: self ]