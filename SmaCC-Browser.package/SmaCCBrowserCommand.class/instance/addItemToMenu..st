user interface
addItemToMenu: aMenu
	(self isActive and: [ self wantsMenu ])
		ifTrue: [ 
			(aMenu add: self label target: self selector: #execute)
				enablementSelector: #isEnabled;
				icon:
						(self icon ifNotNil: [ :iconSelector | Smalltalk ui icons perform: iconSelector ]);
				keyText: self keyString ]