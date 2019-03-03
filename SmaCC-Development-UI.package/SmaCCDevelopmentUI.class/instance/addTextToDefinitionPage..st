initialization
addTextToDefinitionPage: aDefinitionPage
	| aMorph |
	aMorph := self definitionTextModel newScrolledText.
	aMorph announcer
		when: RubTextAcceptRequest
		send: #acceptDefinitionFromTextMorph:
		to: self.
	aDefinitionPage
		addMorph: aMorph
		fullFrame: (LayoutFrame new bottomFraction: 0.7)