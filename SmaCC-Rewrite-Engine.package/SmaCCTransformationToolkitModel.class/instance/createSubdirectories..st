accessing
createSubdirectories: aBoolean
	createSubdirectories := aBoolean.
	modified := true.
	self changed: #createSubdirectories with: aBoolean