private
scenarioStart
	self state: #default.
	^ self createTokenFor: outputStream contents