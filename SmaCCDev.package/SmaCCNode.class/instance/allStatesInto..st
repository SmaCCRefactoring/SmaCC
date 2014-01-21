accessing
allStatesInto: aSet
	(aSet includes: self) ifTrue: [^self].
	aSet add: self.
	transitions do: [:each | each to allStatesInto: aSet]