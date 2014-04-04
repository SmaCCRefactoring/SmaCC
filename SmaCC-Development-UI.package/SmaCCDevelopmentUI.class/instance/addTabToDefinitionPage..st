initialize-release
addTabToDefinitionPage: aDefinitionPage
	self tabList: (self theme newTabGroupIn: World for: #()).
	aDefinitionPage
		addMorph: self tabList
		fullFrame: (LayoutFrame fractions: (0 @ 0.7 corner: 1 @ 1) offsets: (0 @ 4 corner: 0 @ 0)).
	self
		addConflictsBoxToDefinitionPage: self tabList;
		addItemsBoxToDefinitionPage: self tabList;
		addSymbolsBoxToDefinitionPage: self tabList;
		addTestPageToDefinitionPage: self tabList