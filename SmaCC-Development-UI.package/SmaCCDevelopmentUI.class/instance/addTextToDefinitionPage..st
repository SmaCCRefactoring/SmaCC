initialize-release
addTextToDefinitionPage: aDefinitionPage
	| aDefinitionText |
	definitionCodeHolder := SmaCCCodeHolder owner: self ownerAcceptSelector: #acceptDefinition:notifying:.
	aDefinitionText := definitionCodeHolder contentsMorph.
	aDefinitionPage
		addMorph: aDefinitionText
		fullFrame: (LayoutFrame fractions: (0 @ 0.0 corner: 1 @ 0.7) offsets: (0 @ 0 corner: 0 @ 0))