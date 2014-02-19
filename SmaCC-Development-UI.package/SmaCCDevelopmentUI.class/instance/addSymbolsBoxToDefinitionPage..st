initialize-release
addSymbolsBoxToDefinitionPage: aDefinitionPageTabPalette
	self
		symbolsTextMorph:
			((PluggableTextMorph
				on: self
				text: #symbols
				accept: nil
				readSelection: nil
				menu: nil)
				vResizing: #spaceFill;
				hResizing: #spaceFill).
	aDefinitionPageTabPalette
		addPage:
			(aDefinitionPageTabPalette newContentMorph
				addMorph: self symbolsTextMorph;
				yourself)
		label: 'Symbols'