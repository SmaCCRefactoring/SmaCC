private
setPosition: anIndex in: aSequenceableCollection
	| i lastPosition |
	lastPosition := aSequenceableCollection last.
	i := aSequenceableCollection size.
	[i > 0 and: [lastPosition = (aSequenceableCollection at: i)]]
		whileTrue:
			[aSequenceableCollection at: i put: anIndex.
			i := i - 1]