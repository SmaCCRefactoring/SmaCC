generated
code: aDelphiImplementationCodeNode
	self code notNil
		ifTrue: [ self code parent: nil ].
	code := aDelphiImplementationCodeNode.
	self code notNil
		ifTrue: [ self code parent: self ]