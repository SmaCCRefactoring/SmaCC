compiling-scanner
computeSelectorMap
	| selectorMap |
	selectorMap := Dictionary new.
	self symbols keysAndValuesDo: 
			[:index :each | 
			(self scannerActionFor: each name) 
				ifNotNilDo: [:selector | selectorMap at: index put: selector]].
	^selectorMap