initialize-release
createParserPage
	| aParserPage |
	parserCodeHolder := SmaCCCodeHolder owner: self
				ownerAcceptSelector: #acceptParserCode:notifying:.
	aParserPage := parserCodeHolder contentsMorph.
	aParserPage
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	self tabList 
		addPage: (self tabList newContentMorph 
			addMorph: aParserPage; 
			yourself) 
		label: 'Parser'.