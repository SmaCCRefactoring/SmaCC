private
startProtectedVirtualMethod
	self resetCodeStream.
	(self codeStream)
		nextPutAll: self protected;
		nextPutAll: self virtual