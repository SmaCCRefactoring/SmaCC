generated
finally: aDelphiFinallyNode
	self finally notNil
		ifTrue: [ self finally parent: nil ].
	finally := aDelphiFinallyNode.
	self finally notNil
		ifTrue: [ self finally parent: self ]