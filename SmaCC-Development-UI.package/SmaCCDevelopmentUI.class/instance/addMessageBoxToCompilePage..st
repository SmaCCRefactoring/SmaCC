initialize-release
addMessageBoxToCompilePage: aCompilePage
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
	aCompilePage addMorph: self conflictTextMorph.
	aCompilePage addMorph: 'Messages:' asMorph