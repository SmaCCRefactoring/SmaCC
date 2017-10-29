initialization
addTextToDefinitionPage: aDefinitionPage
	definitionCodeHolder := SmaCCCodeHolder
		owner: self
		ownerAcceptSelector: #acceptDefinition:notifying:.
	aDefinitionPage
		addMorph: definitionCodeHolder contentsMorph
		fullFrame: (LayoutFrame new bottomFraction: 0.7)