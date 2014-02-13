generated
_name: aCSTypeNode
	self _name notNil
		ifTrue: [ self _name parent: nil ].
	_name := aCSTypeNode.
	self _name notNil
		ifTrue: [ self _name parent: self ]