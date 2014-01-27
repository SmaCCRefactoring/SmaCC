private
verifyScanner
	| scannerText |
	scannerText := self scannerCodeHolder contentsMorph text.
	scannerText string trimBoth isEmpty
		ifTrue: [UIManager default inform: 'Empty Scanner code'.
			self tabList selectedPageIndex: 1.
			^ false].
	self scannerCodeHolder hasUnacceptedEdits
		ifTrue: [(self acceptScannerCode: scannerText notifying: self scannerCodeHolder contentsMorph)
				ifTrue: [self scannerCodeHolder acceptContents: scannerText.
					self scannerCodeHolder changed: #contents.
					^ true].
			^ false].
	^ true