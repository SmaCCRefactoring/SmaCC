initialize-release
addConflictsBoxToDefinitionPage: aDefinitionPageTabPalette
	self
		conflictTextMorph:
			((PluggableTextMorph
				on: self
				text: #conflicts
				accept: nil
				readSelection: nil
				menu: nil)
				vResizing: #spaceFill;
				hResizing: #spaceFill).
	aDefinitionPageTabPalette
		addPage:
			(aDefinitionPageTabPalette newContentMorph
				addMorph: self conflictTextMorph;
				yourself)
		label: 'Messages'