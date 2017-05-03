actions
saveConfiguration
	filename isNil
		ifTrue: [ filename := self promptForFile: 'Save Configuration To' extensions: #('rwc').
			filename isNil
				ifTrue: [ ^ self ] ].
	self model saveTo: filename