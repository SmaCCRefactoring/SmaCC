generated
body: aGstSequenceNode
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aGstSequenceNode.
	self body notNil
		ifTrue: [ self body parent: self ]