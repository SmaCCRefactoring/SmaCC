initialization
addSymbolsBoxToDefinitionPage: aDefinitionPageTabPalette
	| aMorph |
	aMorph := self symbolsTextModel newScrolledText.
	aMorph
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		beReadOnly.
	aDefinitionPageTabPalette
		addPage:
			(aDefinitionPageTabPalette newContentMorph
				addMorph: aMorph;
				yourself)
		label: 'Symbols'