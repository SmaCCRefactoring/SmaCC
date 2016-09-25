generated
name: aPyDottedNameNode
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aPyDottedNameNode.
	self name notNil
		ifTrue: [ self name parent: self ]