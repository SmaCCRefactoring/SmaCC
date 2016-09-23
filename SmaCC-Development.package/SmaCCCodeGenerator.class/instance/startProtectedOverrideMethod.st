private
startProtectedOverrideMethod
	self resetCodeStream.
	self codeStream
		nextPutAll: self protected;
		nextPutAll: self override