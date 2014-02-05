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
	aCompilePage addMorph: self conflictTextMorph.	"		fullFrame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 1) offsets: (10 @ 210 corner: -10 @ -10))"
	aCompilePage addMorph: 'Messages:' asMorph