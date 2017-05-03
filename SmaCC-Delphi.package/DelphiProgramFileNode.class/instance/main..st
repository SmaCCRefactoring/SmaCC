generated
main: aDelphiMainMethodDefinitionNode
	self main notNil
		ifTrue: [ self main parent: nil ].
	main := aDelphiMainMethodDefinitionNode.
	self main notNil
		ifTrue: [ self main parent: self ]