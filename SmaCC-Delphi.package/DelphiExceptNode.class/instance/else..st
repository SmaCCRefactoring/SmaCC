generated
else: aDelphiExceptElseNode
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := aDelphiExceptElseNode.
	self else notNil
		ifTrue: [ self else parent: self ]