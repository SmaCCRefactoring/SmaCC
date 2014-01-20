accessing
mergeWith: aSmaCCItemSet 
	self == aSmaCCItemSet ifTrue: [^self].
	aSmaCCItemSet do: [:each | self add: each]