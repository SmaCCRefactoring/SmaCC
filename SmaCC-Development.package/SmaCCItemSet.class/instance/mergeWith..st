accessing
mergeWith: aSmaCCItemSet
	self == aSmaCCItemSet ifTrue: [^self].
	self addAll: aSmaCCItemSet.
	previousItemSets addAll: aSmaCCItemSet previousItemSets