generated
except2: aPyRootNode
	self except2 notNil
		ifTrue: [ self except2 parent: nil ].
	except2 := aPyRootNode.
	self except2 notNil
		ifTrue: [ self except2 parent: self ]