initialization
initializeTabModel
	tabModel := self instantiate: SmaCCTabManagerModel.
	tabModel
		addTab: self definitionTab;
		addTab: self messagesTab;
		addTab: self symbolsTab;
		addTab: self itemSetsTab;
		addTab: self testTab