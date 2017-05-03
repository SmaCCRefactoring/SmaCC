generated
guid: aDelphiGuidNode
	self guid notNil
		ifTrue: [ self guid parent: nil ].
	guid := aDelphiGuidNode.
	self guid notNil
		ifTrue: [ self guid parent: self ]