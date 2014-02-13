generated
body: aCSMethodBodyNode
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aCSMethodBodyNode.
	self body notNil
		ifTrue: [ self body parent: self ]