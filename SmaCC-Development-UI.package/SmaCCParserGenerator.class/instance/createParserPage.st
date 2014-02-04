initialize-release
createParserPage
	| aParserPage |
	definitionCodeHolder := SmaCCCodeHolder owner: self ownerAcceptSelector: #acceptDefinition:notifying:.
	aParserPage := definitionCodeHolder contentsMorph.
	aParserPage
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	self tabList
		addPage:
			(self tabList newContentMorph
				addMorph: aParserPage;
				yourself)
		label: 'Definition'