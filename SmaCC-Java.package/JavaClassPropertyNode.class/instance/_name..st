generated
_name: aJavaNameNode
	self _name notNil
		ifTrue: [ self _name parent: nil ].
	_name := aJavaNameNode.
	self _name notNil
		ifTrue: [ self _name parent: self ]