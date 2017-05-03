generated
arrayAccessors: aDelphiPropertyArrayAccessorsNode
	self arrayAccessors notNil
		ifTrue: [ self arrayAccessors parent: nil ].
	arrayAccessors := aDelphiPropertyArrayAccessorsNode.
	self arrayAccessors notNil
		ifTrue: [ self arrayAccessors parent: self ]