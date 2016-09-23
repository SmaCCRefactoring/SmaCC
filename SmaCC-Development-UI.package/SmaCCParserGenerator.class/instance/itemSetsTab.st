initialization
itemSetsTab
	itemSetsModel := self instantiate: TextModel.
	itemSetsModel disable.
	^ self newTab
		closeable: false;
		label: 'Item Sets';
		model: itemSetsModel;
		yourself