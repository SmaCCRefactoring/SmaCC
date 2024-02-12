initialization
initialize
	mainWindow := StandardWindow new.
	mainWindow model: self.
	mainWindow announcer when: WindowClosed send: #release to: self.
	SystemAnnouncer uniqueInstance
		when:
			ClassAdded , ClassRemoved , ClassReorganized , ClassRenamed
				, ClassModifiedClassDefinition
			send: #updateClasses
			to: self;
		when: MethodModified send: #updateDefinition: to: self.
	self createDefinitionPage.
	self updateTitle