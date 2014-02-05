initialize-release
addTextToTestPage: aTestPage
	| aTestText |
	testCodeHolder := SmaCCCodeHolder owner: self ownerAcceptSelector: #acceptTestCode:notifying:.
	aTestText := testCodeHolder contentsMorph.
	aTestText
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color transparent.
	aTestPage addMorph: aTestText