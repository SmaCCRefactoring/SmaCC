initialize-release
addTextToDefinitionPage: aDefinitionPage
	definitionCodeHolder := SmaCCCodeHolder
		owner: self
		ownerAcceptSelector: #acceptDefinition:notifying:.
	aDefinitionPage
		addMorph: definitionCodeHolder contentsMorph
		fullFrame:
			(LayoutFrame
				fractions: (0 @ 0.0 corner: 1 @ 0.7)
				offsets: (0 @ 0 corner: 0 @ 0))