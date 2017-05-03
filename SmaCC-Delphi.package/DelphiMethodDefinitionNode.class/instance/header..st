generated
header: aDelphiMethodHeaderNode
	self header notNil
		ifTrue: [ self header parent: nil ].
	header := aDelphiMethodHeaderNode.
	self header notNil
		ifTrue: [ self header parent: self ]