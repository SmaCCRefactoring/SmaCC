copying
postCopy
	super postCopy.
	self match: self match copy.
	self transformation: self transformation copy.
	engine := nil