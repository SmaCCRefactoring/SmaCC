generated
unitName: aDelphiModuleNameNode
	self unitName notNil
		ifTrue: [ self unitName parent: nil ].
	unitName := aDelphiModuleNameNode.
	self unitName notNil
		ifTrue: [ self unitName parent: self ]