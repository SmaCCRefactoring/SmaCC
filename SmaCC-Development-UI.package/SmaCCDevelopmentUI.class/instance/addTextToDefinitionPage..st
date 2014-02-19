initialize-release
addTextToDefinitionPage: aDefinitionPage
	| aDefinitionText |
	definitionCodeHolder := SmaCCCodeHolder owner: self ownerAcceptSelector: #acceptDefinition:notifying:.
	aDefinitionText := definitionCodeHolder contentsMorph.
	aDefinitionText
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	aDefinitionPage addMorph: aDefinitionText