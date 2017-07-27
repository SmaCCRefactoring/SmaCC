instance creation
onAction: anAction for: aSymbol in: aTable
	self allSubclasses
		do: [ :c | 
			(c forAction: anAction)
				ifTrue: [ ^ c on: anAction for: aSymbol in: aTable ] ].
	self error: 'Unhandled action'