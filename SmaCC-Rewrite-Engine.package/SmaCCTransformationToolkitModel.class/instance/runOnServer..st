accessing
runOnServer: aBoolean
	runOnServer := aBoolean.
	modified := true.
	self changed: #runOnServer with: aBoolean