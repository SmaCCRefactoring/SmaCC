private
stepStart
	self state: #default.
	^ self createTokenFor: outputStream contents