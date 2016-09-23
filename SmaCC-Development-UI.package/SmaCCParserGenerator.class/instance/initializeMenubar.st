initialization
initializeMenubar
	menu := (DockingBarMorph new
		add: 'File'
			subMenu:
			(MenuMorph new
				defaultTarget: self;
				add: 'Open...' selector: #findParserClass;
				add: 'Save' selector: #compile;
				addLine;
				add: 'Exit' selector: #close;
				yourself);
		add: 'Options'
			subMenu:
			(optionsMenu := MenuMorph new
				defaultTarget: self;
				add: 'Scanner Class...' selector: #setScannerClass;
				add: 'Parser Class...' selector: #setParserClass;
				addLine;
				add: 'Allow Unicode Characters' selector: #useUnicode;
				addLine;
				add: 'LALR(1)' selector: #setLALR1;
				add: 'LR(1)' selector: #setLR1;
				yourself);
		yourself) asSpecAdapter