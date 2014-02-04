initialize-release
addButtonsToTestPage: aTestPage
	| aParserButton aParserInspectButton aParserExploreButton |
	aParserButton := PluggableButtonMorph on: self getState: nil action: #parse.
	aParserButton
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		label: 'Parse'.
	aParserInspectButton := PluggableButtonMorph on: self getState: nil action: #parseAndInspect.
	aParserInspectButton
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		label: 'Parse and inspect'.
	aParserExploreButton := PluggableButtonMorph on: self getState: nil action: #parseAndExplore.
	aParserExploreButton
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		label: 'Parse and explore'.
	aTestPage
		addMorph: aParserButton
			fullFrame: (LayoutFrame fractions: (0 @ 1 corner: 0.33 @ 1) offsets: (0 @ (1 - 25) corner: 0 @ 0));
		addMorph: aParserInspectButton
			fullFrame: (LayoutFrame fractions: (0.33 @ 1 corner: 0.66 @ 1) offsets: (0 @ (1 - 25) corner: 0 @ 0));
		addMorph: aParserExploreButton
			fullFrame: (LayoutFrame fractions: (0.66 @ 1 corner: 1 @ 1) offsets: (0 @ (1 - 25) corner: 0 @ 0))