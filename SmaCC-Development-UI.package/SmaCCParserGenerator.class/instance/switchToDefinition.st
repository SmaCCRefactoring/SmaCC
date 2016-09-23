private
switchToDefinition
	tabModel selectedTab label ~= 'Definition'
		ifTrue: [ tabModel selectedTab: tabModel tabs first ]