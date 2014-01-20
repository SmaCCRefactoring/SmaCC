private
binarySearchInBytes: aRow for: aSymbolIndex size: step
	| start mid length high low midItem stop |
	high := aSymbolIndex bitShift: -8.
	low := aSymbolIndex bitAnd: 16rFF.
	start := 4.
	stop := aRow size - 1.
	length := (stop - start) // step.
	[length > 4]
		whileTrue:
			[length := length bitShift: -1.
			mid := length * step + start.
			midItem := aRow at: mid.
			((midItem == high and: [(aRow at: mid + 1) <= low]) or: [midItem < high])
				ifTrue: [start := mid]
				ifFalse: [stop := mid]].
	[start <= stop]
		whileTrue:
			[((aRow at: start) == high and: [(aRow at: start + 1) == low]) ifTrue: [^start].
			start := start + step].
	^0