private
startPublicOverrideMethod
	self resetCodeStream.
	self codeStream
		nextPutAll: self public;
		nextPutAll: self override