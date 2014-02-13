generated
_name: aCSSimpleNameNode
	self _name notNil
		ifTrue: [ self _name parent: nil ].
	_name := aCSSimpleNameNode.
	self _name notNil
		ifTrue: [ self _name parent: self ]