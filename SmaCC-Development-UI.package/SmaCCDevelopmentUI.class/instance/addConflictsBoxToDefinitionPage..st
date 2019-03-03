initialization
addConflictsBoxToDefinitionPage: aDefinitionPageTabPalette
	| aMorph |
	aMorph := self conflictsTextModel newScrolledText.
	aMorph
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		beReadOnly.
	aDefinitionPageTabPalette
		addPage:
			(aDefinitionPageTabPalette newContentMorph
				addMorph: aMorph;
				yourself)
		label: 'Messages'