initialize-release
initialize
	mainWindow := StandardWindow labelled: self defaultWindowLabelPrefix.
	mainWindow model: self.
	self createDefinitionPage.
"	self createTabbedPalette.
	self createParserPage.
	self createCompilePage.
	self createTestPage."
	self updateWindowLabel.
"	self tabList selectedPageIndex: 3"