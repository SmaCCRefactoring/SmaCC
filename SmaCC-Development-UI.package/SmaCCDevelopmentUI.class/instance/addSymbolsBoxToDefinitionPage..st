initialization
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
				hResizing: #spaceFill;
				enabled: false;
				yourself).
	aDefinitionPageTabPalette
		addPage:
			(aDefinitionPageTabPalette newContentMorph
				addMorph: self symbolsTextMorph;
				yourself)
		label: 'Symbols'