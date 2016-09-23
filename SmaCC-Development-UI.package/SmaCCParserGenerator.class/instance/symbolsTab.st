initialization
symbolsTab
	symbolsModel := self instantiate: TextModel.
	symbolsModel disable.
	^ self newTab
		closeable: false;
		label: 'Symbols';
		model: symbolsModel;
		yourself