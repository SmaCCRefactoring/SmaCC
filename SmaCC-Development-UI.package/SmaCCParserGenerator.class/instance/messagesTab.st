initialization
messagesTab
	messagesModel := self instantiate: TextModel.
	messagesModel disable.
	^ self newTab
		closeable: false;
		label: 'Messages';
		model: messagesModel;
		yourself