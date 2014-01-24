private
computeSelectorMap
	| selectorMap |
	selectorMap := Dictionary new.
	self symbols
		keysAndValuesDo:
			[:index :each | 
			(codeGenerator scannerActionFor: each name)
				ifNotNil: [:selector | selectorMap at: index put: selector]].
	^selectorMap