private
startPublicVirtualMethod
	self resetCodeStream.
	(self codeStream)
		nextPutAll: self public;
		nextPutAll: self virtual