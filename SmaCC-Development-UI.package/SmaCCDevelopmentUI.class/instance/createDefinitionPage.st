initialize-release
createDefinitionPage
	| aDefinitionPage |
	aDefinitionPage := PanelMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent;
		changeTableLayout;
		cellInset: 0;
		cellPositioning: #leftCenter;
		yourself.	"non pane color tracking"
	self mainWindow addMorph: aDefinitionPage frame: (0 @ 0 corner: 1 @ 1).
	self
		addTabToDefinitionPage: aDefinitionPage;
		addTextToDefinitionPage: aDefinitionPage;
		addCompileButtonsToCompilePage: aDefinitionPage;
		addCheckBoxesToCompilePage: aDefinitionPage;
		addClassSelectorsToCompilePage: aDefinitionPage.
	self tabList selectedPageIndex: 1