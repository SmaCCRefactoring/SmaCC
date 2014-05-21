generated
args: anASTPythonNode
	self args notNil
		ifTrue: [ self args parent: nil ].
	args := anASTPythonNode.
	self args notNil
		ifTrue: [ self args parent: self ]