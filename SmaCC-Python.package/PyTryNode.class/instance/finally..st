generated
finally: aPyFinallyNode
	self finally notNil
		ifTrue: [ self finally parent: nil ].
	finally := aPyFinallyNode.
	self finally notNil
		ifTrue: [ self finally parent: self ]