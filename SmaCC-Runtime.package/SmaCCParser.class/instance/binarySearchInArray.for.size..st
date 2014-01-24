private
binarySearchInArray: aRow for: aSymbolIndex size: step 
	| start mid length midItem stop |
	start := 3.
	stop := aRow size.
	length := (stop - start) // step.
	[length > 4] whileTrue: 
			[length := length bitShift: -1.
			mid := length * step + start.
			midItem := aRow at: mid.
			midItem <= aSymbolIndex ifTrue: [start := mid] ifFalse: [stop := mid]].
	[start <= stop] whileTrue: 
			[(aRow at: start) == aSymbolIndex ifTrue: [^start].
			start := start + step].
	^0