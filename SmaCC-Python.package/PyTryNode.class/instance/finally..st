generated
finally: aPyRootNode
	self finally notNil
		ifTrue: [ self finally parent: nil ].
	finally := aPyRootNode.
	self finally notNil
		ifTrue: [ self finally parent: self ]