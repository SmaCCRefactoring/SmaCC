accessing
runOnServer: aBoolean
	runOnServer := aBoolean.
	modified := true.
	self trigger: #runOnServer with: aBoolean