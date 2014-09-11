generated
except: aPyRootNode
	self except notNil
		ifTrue: [ self except parent: nil ].
	except := aPyRootNode.
	self except notNil
		ifTrue: [ self except parent: self ]