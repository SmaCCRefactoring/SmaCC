accessing
symbol
	^ (selectorParts inject: '' into: [ :sum :each | sum , each value ])
		asSymbol