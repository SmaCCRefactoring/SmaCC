private
tagStart
	self state: #default.
	^ self createTokenFor: outputStream contents