initialization
addItemsBoxToDefinitionPage: aDefinitionPageTabPalette
	| aMorph |
	aMorph := self itemsTextModel newScrolledText.
	aMorph
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		beReadOnly.
	aDefinitionPageTabPalette
		addPage:
			(aDefinitionPageTabPalette newContentMorph
				addMorph: aMorph;
				yourself)
		label: 'Items Sets'