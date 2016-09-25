initialize-release
initialize
	mainWindow := StandardWindow labelled: self defaultWindowLabelPrefix.
	mainWindow model: self.
	self createDefinitionPage.
	self updateWindowLabel