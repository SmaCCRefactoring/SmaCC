private
rowStart
	self state: #inRow.
	^ self createTokenFor: outputStream contents