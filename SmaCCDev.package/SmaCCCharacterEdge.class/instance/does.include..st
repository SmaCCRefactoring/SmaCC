private
does: aSequenceableCollection include: anObject 
	| start stop mid |
	(anObject isKindOf: Character) ifFalse: [^false].
	start := 1.
	stop := aSequenceableCollection size.
	stop = 0 ifTrue: [^false].
	
	[mid := (start + stop) // 2.
	mid = start] whileFalse: 
				[(aSequenceableCollection at: mid) asInteger < anObject asInteger 
					ifTrue: [start := mid]
					ifFalse: [stop := mid]].
	^(aSequenceableCollection at: start) = anObject 
		or: [(aSequenceableCollection at: stop) = anObject]