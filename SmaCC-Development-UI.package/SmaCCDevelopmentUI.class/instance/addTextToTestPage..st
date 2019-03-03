initialization
addTextToTestPage: aTestPage
	| aTestText aMorph |
	aMorph := self testTextModel newScrolledText.
	aMorph
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		beForPlainText.
	aTestPage addMorph: aMorph