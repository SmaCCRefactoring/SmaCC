generated
_in: aPyRootNode
	self _in notNil
		ifTrue: [ self _in parent: nil ].
	_in := aPyRootNode.
	self _in notNil
		ifTrue: [ self _in parent: self ]