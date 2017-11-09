initialization
createDefinitionPage
	| aDefinitionPage group |
	aDefinitionPage := PanelMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent;
		changeTableLayout;
		cellInset: 0;
		cellPositioning: #leftCenter;
		yourself.	"non pane color tracking"
	self mainWindow addMorph: aDefinitionPage frame: (0 @ 0 corner: 1 @ 1).
	group := Morph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent;
		changeProportionalLayout;
		yourself.	"non pane color tracking"
	self
		addTabToDefinitionPage: group;
		addTextToDefinitionPage: group.
	group
		addMorph:
			(ProportionalSplitterMorph new
				layoutFrame: (LayoutFrame new
						topFraction: 0.7 offset: 0;
						bottomFraction: 0.7 offset: 4);
				addLeftOrTop: group submorphs first;
				addRightOrBottom: group submorphs last;
				beSplitsTopAndBottom).
	aDefinitionPage addMorph: group.
	self
		addCompileButtonsToCompilePage: aDefinitionPage;
		addClassSelectorsToCompilePage: aDefinitionPage.
	self tabList selectedPageIndex: 1