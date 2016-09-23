initialization
testTab
	testModel := self instantiate: TextModel.
	testModel
		autoAccept: true;
		menuHolder: [ :mnu | self testMenu: mnu ].
	^ self newTab
		closeable: false;
		label: 'Test';
		model: testModel;
		yourself