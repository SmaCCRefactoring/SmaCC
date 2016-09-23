building
debuggerTransmissionsIn: browser
	super debuggerTransmissionsIn: browser.
	self buildGLRTransmissionsIn: browser.
	self buildStackStateIn: browser.
	self buildPotentialTokensIn: browser.
	self buildScannerStateIn: browser.
	self buildInputIn: browser