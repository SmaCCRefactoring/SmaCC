dependencies
release
	SystemAnnouncer uniqueInstance unsubscribe: self.
	mainWindow ifNotNil: [ mainWindow announcer unsubscribe: self ].
	super release