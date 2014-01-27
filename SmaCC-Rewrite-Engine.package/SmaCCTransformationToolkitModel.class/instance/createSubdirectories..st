accessing
createSubdirectories: aBoolean
	createSubdirectories := aBoolean.
	modified := true.
	self trigger: #createSubdirectories with: aBoolean