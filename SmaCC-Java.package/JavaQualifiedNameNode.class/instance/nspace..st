generated
nspace: aJavaNameNode
	self nspace notNil
		ifTrue: [ self nspace parent: nil ].
	nspace := aJavaNameNode.
	self nspace notNil
		ifTrue: [ self nspace parent: self ]