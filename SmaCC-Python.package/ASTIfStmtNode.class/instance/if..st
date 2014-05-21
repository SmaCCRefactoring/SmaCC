generated
if: anASTPythonNode
	self if notNil
		ifTrue: [ self if parent: nil ].
	if := anASTPythonNode.
	self if notNil
		ifTrue: [ self if parent: self ]