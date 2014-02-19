initialize-release
createDefinitionPage
	| aDefinitionPage |
	aDefinitionPage := AlignmentMorph newColumn
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellPositioning: #leftCenter;
		color: self mainWindow defaultBackgroundColor;
		yourself.
	self mainWindow addMorph: aDefinitionPage frame: (0 @ 0 corner: 1 @ 1).
	self
		addTabToDefinitionPage: aDefinitionPage;
		addTextToDefinitionPage: aDefinitionPage;
		addCompileButtonsToCompilePage: aDefinitionPage;
		addCheckBoxesToCompilePage: aDefinitionPage;
		addClassSelectorsToCompilePage: aDefinitionPage.
			"Now, force a cycle through all tabs to make sure the layout is OK."
	self tabList
		selectedPageIndex: 4;
		selectedPageIndex: 1