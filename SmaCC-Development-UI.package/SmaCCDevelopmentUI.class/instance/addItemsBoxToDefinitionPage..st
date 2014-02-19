initialize-release
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
				hResizing: #spaceFill).
	aDefinitionPageTabPalette
		addPage:
			(aDefinitionPageTabPalette newContentMorph
				addMorph: self itemsTextMorph;
				yourself)
		label: 'Items Sets'