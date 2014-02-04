initialize-release
createTutorialPage
	| aTutorialPage |
	tutorialTextHolder := SmaCCCodeHolder owner: self ownerAcceptSelector: nil.
	aTutorialPage := tutorialTextHolder contentsMorph.
	tutorialTextHolder acceptContents: self tutorialText.
	tutorialTextHolder changed: #contents.
	aTutorialPage
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	self tabList
		addPage:
			(self tabList newContentMorph
				addMorph: aTutorialPage;
				yourself)
		label: 'Tutorial'