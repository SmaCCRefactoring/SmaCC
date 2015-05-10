private
scenarioOutlineStart
	self state: #default.
	^ self createTokenFor: outputStream contents