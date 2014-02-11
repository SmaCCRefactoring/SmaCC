generated
type: aJavaClassTypeNode
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aJavaClassTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]