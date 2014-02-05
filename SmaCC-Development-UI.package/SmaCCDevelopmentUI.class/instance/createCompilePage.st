initialize-release
createCompilePage
	| aCompilePage |
	aCompilePage := AlignmentMorph newColumn
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellPositioning: #leftCenter;
		color: Color transparent;
		yourself.
	self tabList
		addPage:
			(self tabList newContentMorph
				addMorph: aCompilePage;
				yourself)
		label: 'Compile'.
	self
		addMessageBoxToCompilePage: aCompilePage;
		addCompileButtonsToCompilePage: aCompilePage;
		addCheckBoxesToCompilePage: aCompilePage;
		addClassSelectorsToCompilePage: aCompilePage