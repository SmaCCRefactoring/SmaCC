initialize-release
createTabbedPalette
	self tabList: (self theme newTabGroupIn: World for: #()).
	self mainWindow 
		addMorph: self tabList
		frame: (0 @ 0 corner: 1 @ 1)