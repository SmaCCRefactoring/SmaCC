view
defaultTreeMorph
	^ super defaultTreeMorph
		doubleClickSelector: #doubleClick;
		nodeStringGetter: #asString;
		getMenuSelector: #buildTreeMenu:;
		withHLines: false;
		yourself