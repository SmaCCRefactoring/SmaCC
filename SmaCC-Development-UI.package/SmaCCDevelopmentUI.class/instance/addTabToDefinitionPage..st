initialize-release
addTabToDefinitionPage: aDefinitionPage
	self tabList: (self theme newTabGroupIn: World for: #()).
	self tabList
		height: 200;
		vResizing: #rigid;
		hResizing: #spaceFill.
	aDefinitionPage addMorph: self tabList.
	self
		addConflictsBoxToDefinitionPage: self tabList;
		addItemsBoxToDefinitionPage: self tabList;
		addSymbolsBoxToDefinitionPage: self tabList;
		addTestPageToDefinitionPage: self tabList