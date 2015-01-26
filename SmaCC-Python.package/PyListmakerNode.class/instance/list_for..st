generated
list_for: aPyListForNode
	self list_for notNil
		ifTrue: [ self list_for parent: nil ].
	list_for := aPyListForNode.
	self list_for notNil
		ifTrue: [ self list_for parent: self ]