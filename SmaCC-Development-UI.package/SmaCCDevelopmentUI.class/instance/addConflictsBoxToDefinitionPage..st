initialization
addConflictsBoxToDefinitionPage: aDefinitionPageTabPalette
	self
		conflictTextMorph:
			((RubPluggableTextMorph
				on: self
				text: #conflicts
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
				addMorph: self conflictTextMorph;
				yourself)
		label: 'Messages'