generated
dotted_name: aPyDottedNameNode
	self dotted_name notNil
		ifTrue: [ self dotted_name parent: nil ].
	dotted_name := aPyDottedNameNode.
	self dotted_name notNil
		ifTrue: [ self dotted_name parent: self ]