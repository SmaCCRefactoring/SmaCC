initialization
addTabToDefinitionPage: aDefinitionPage
	self tabList: (self theme newTabGroupIn: World for: #()).
	aDefinitionPage
		addMorph: self tabList
		fullFrame: (LayoutFrame new
							topFraction: 0.7 offset: 0;
							bottomFraction: 1 offset: 4).
	self
		addConflictsBoxToDefinitionPage: self tabList;
		addItemsBoxToDefinitionPage: self tabList;
		addSymbolsBoxToDefinitionPage: self tabList;
		addTestPageToDefinitionPage: self tabList