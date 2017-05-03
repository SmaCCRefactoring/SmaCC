generated
modifier: aDelphiPropertyModifierNode
	self modifier notNil
		ifTrue: [ self modifier parent: nil ].
	modifier := aDelphiPropertyModifierNode.
	self modifier notNil
		ifTrue: [ self modifier parent: self ]