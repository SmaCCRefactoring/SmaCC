generated
type: aJavaTypeNode
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aJavaTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]