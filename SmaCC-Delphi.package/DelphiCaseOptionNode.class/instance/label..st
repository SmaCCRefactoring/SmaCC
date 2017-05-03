generated
label: aDelphiProgramNode
	self label notNil
		ifTrue: [ self label parent: nil ].
	label := aDelphiProgramNode.
	self label notNil
		ifTrue: [ self label parent: self ]