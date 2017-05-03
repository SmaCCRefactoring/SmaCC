generated
enumerator: anASTEnumeratorNode
	self enumerator notNil
		ifTrue: [ self enumerator parent: nil ].
	enumerator := anASTEnumeratorNode.
	self enumerator notNil
		ifTrue: [ self enumerator parent: self ]