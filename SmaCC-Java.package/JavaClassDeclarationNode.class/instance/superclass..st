generated
superclass: aJavaClassTypeNode
	self superclass notNil ifTrue: [self superclass parent: nil].
	superclass := aJavaClassTypeNode.
	self superclass notNil ifTrue: [self superclass parent: self]