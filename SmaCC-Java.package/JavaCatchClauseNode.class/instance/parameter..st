generated
parameter: aJavaParameterNode
	self parameter notNil
		ifTrue: [ self parameter parent: nil ].
	parameter := aJavaParameterNode.
	self parameter notNil
		ifTrue: [ self parameter parent: self ]