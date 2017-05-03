generated
except: aDelphiExceptNode
	self except notNil
		ifTrue: [ self except parent: nil ].
	except := aDelphiExceptNode.
	self except notNil
		ifTrue: [ self except parent: self ]