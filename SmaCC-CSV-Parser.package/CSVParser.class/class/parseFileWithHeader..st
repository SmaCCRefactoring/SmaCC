parsing
parseFileWithHeader: aFilename
	| lines headerLine headerNames |
	lines := self parseFileWithoutHeader: aFilename.
	lines isEmpty
		ifTrue: [ ^ lines ].
	headerLine := lines removeFirst.
	headerNames := (1 to: headerLine size)
		collect: [ :i | (headerLine at: i) ifNil: [ 'Column ' , i printString ] ].
	1 to: lines size do:
		[ :i | 
		| line dict |
		dict := Dictionary new: headerNames size.
		headerNames
			with: (lines at: i)
			do: [ :header :value | dict at: header put: value ].
		lines at: i put: dict ].
	^ lines