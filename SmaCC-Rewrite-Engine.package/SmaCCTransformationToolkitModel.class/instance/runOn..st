actions-running
runOn: tranformationFiles
	self runOnServer
		ifTrue: [ self serverRunOn: tranformationFiles ]
		ifFalse: [ self localRunOn: tranformationFiles ]