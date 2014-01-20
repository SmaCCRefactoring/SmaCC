initialize-release
initialize
	mainWindow := StandardWindow labelled: self defaultWindowLabelPrefix.
	mainWindow model: self.
	self createTabbedPalette.
	self createScannerPage.
	self createParserPage.
	self createCompilePage.
	self createTestPage.
	self createTutorialPage.
	self updateWindowLabel.
	self tabList selectedPageIndex: 3