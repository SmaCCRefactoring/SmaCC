private
startStaticPrivateMethod
	self resetCodeStream.
	(self codeStream)
		nextPutAll: self static;
		nextPutAll: self private