actions
close
	self isModified
		ifTrue: [ self promptToSaveChanges
				ifFalse: [ ^ self ] ].
	self window close