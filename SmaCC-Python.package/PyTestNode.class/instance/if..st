generated
if: aPyRootNode
	self if notNil
		ifTrue: [ self if parent: nil ].
	if := aPyRootNode.
	self if notNil
		ifTrue: [ self if parent: self ]