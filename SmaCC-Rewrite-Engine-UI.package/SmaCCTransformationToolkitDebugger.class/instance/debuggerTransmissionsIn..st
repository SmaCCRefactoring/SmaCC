building
debuggerTransmissionsIn: browser
	super debuggerTransmissionsIn: browser.
	self buildInputOutputSourceIn: browser.
	self buildRuleStackIn: browser.
	self buildRuleSourceIn: browser.