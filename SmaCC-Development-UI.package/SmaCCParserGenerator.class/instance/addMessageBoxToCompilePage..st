initialize-release
addMessageBoxToCompilePage: aCompilePage 
	aCompilePage addMorph: ('Messages:' asMorph position: 10 @ 180;
			 yourself).
	self conflictTextMorph: (PluggableTextMorph
				on: self
				text: #conflicts
				accept: nil
				readSelection: nil
				menu: nil).
	aCompilePage
		addMorph: (self conflictTextMorph)
		fullFrame: (LayoutFrame
				fractions: (0 @ 0 corner: 1 @ 1)
				offsets: (10 @ 200 corner: -10 @ -10))