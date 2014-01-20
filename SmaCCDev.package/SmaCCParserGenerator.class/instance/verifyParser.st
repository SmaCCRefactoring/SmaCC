private
verifyParser
	| parserCode |
	parserCode := self parserCodeHolder contentsMorph text.
	parserCode string trimBoth isEmpty
		ifTrue: [UIManager default inform: 'Empty Parser code'.
			self tabList selectedPageIndex: 2.
			^ false].
	self parserCodeHolder hasUnacceptedEdits
		ifTrue: [(self acceptParserCode: parserCode notifying: self parserCodeHolder contentsMorph)
				ifTrue: [self parserCodeHolder acceptContents: parserCode.
					self parserCodeHolder changed: #contents]
				ifFalse: [^ false]].
	^ true