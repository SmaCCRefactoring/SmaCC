initialization
initialize
	mainWindow := StandardWindow new.
	mainWindow model: self.
	self createDefinitionPage.
	self updateTitle