initialize-release
createTestPage
	| aTestPage |
	aTestPage := Morph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		layoutPolicy: ProportionalLayout new;
		color: Color transparent;
		yourself.
	self addTextToTestPage: aTestPage.
	self addButtonsToTestPage: aTestPage.
	self tabList
		addPage:
			(self tabList newContentMorph
				addMorph: aTestPage;
				yourself)
		label: 'Test'