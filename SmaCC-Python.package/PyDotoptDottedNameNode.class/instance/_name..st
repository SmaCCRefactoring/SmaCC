generated
_name: aPyDottedNameNode
	self _name notNil
		ifTrue: [ self _name parent: nil ].
	_name := aPyDottedNameNode.
	self _name notNil
		ifTrue: [ self _name parent: self ]