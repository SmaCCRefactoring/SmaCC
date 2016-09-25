initialize-release
initialize
	super initialize.
	firstTerminals add: self.
	createIdMethod := false