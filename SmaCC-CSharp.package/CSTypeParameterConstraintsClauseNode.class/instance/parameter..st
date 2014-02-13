generated
parameter: aCSTypeNameNode
	self parameter notNil
		ifTrue: [ self parameter parent: nil ].
	parameter := aCSTypeNameNode.
	self parameter notNil
		ifTrue: [ self parameter parent: self ]