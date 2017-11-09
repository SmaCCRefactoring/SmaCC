initialization
addItemsBoxToDefinitionPage: aDefinitionPageTabPalette
	self
		itemsTextMorph:
			((PluggableTextMorph
				on: self
				text: #items
				accept: nil
				readSelection: nil
				menu: nil)
				vResizing: #spaceFill;
				hResizing: #spaceFill;
				enabled: false;
				yourself).
	aDefinitionPageTabPalette
		addPage:
			(aDefinitionPageTabPalette newContentMorph
				addMorph: self itemsTextMorph;
				yourself)
		label: 'Items Sets'