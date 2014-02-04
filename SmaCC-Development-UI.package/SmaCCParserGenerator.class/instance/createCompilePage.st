initialize-release
createCompilePage
	| aCompilePage |
	aCompilePage := Morph new
		layoutPolicy: ProportionalLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color transparent.
	self tabList
		addPage:
			(self tabList newContentMorph
				addMorph: aCompilePage;
				yourself)
		label: 'Compile'.
	self
		addClassSelectorsToCompilePage: aCompilePage;
		addCompileButtonsToCompilePage: aCompilePage;
		addCheckBoxesToCompilePage: aCompilePage;
		addMessageBoxToCompilePage: aCompilePage