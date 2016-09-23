private
textWidget
	tabModel selectedTab == definitionModel owner
		ifTrue: [ ^ definitionModel ].
	tabModel selectedTab == testModel owner
		ifTrue: [ ^ testModel ].
	^ nil