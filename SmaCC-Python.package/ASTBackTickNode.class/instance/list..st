generated
list: anASTPythonNode
	self list notNil
		ifTrue: [ self list parent: nil ].
	list := anASTPythonNode.
	self list notNil
		ifTrue: [ self list parent: self ]