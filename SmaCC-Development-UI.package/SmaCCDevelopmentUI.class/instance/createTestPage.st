initialization
createTestPage
	| aTestPage |
	aTestPage := AlignmentMorph newColumn
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellPositioning: #leftCenter;
		color: Color transparent;
		yourself.
	self addButtonsToTestPage: aTestPage.
	self addTextToTestPage: aTestPage.
	self tabList
		addPage:
			(self tabList newContentMorph
				addMorph: aTestPage;
				yourself)
		label: 'Test'