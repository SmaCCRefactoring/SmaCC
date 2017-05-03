initialize-release
addButtonsToTestPage: aTestPage
	| aParserButton aParserInspectButton aParserExploreButton |
	aParserButton := PluggableButtonMorph
		on: self
		getState: nil
		action: #parse.
	aParserButton
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		label: 'Parse'.
	aParserInspectButton := PluggableButtonMorph
		on: self
		getState: nil
		action: #parseAndInspect.
	aParserInspectButton
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		label: 'Parse and inspect'.
	aParserExploreButton := PluggableButtonMorph
		on: self
		getState: nil
		action: #parseInDebug.
	aParserExploreButton
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		label: 'Parse in debug'.
	aTestPage
		addMorph:
			(AlignmentMorph newRow
				vResizing: #shrinkWrap;
				hResizing: #spaceFill;
				layoutInset: 0;
				addMorph: aParserButton;
				addMorph: aParserInspectButton;
				addMorph: aParserExploreButton;
				yourself)