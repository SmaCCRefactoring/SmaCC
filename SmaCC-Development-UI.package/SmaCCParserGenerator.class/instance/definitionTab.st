initialization
definitionTab
	definitionModel := self instantiate: TextModel.
	definitionModel autoAccept: true.
	^ self newTab
		closeable: false;
		label: 'Definition';
		model: definitionModel;
		yourself