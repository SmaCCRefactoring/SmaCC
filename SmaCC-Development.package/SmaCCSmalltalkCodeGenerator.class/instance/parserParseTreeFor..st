private
parserParseTreeFor: aSelector
	^ parseTreeCache
		at: aSelector
		ifAbsentPut:
			[ | definingClass |
			definingClass := self parserClass whoDefinesMethod: aSelector.
			definingClass parseTreeFor: aSelector ]