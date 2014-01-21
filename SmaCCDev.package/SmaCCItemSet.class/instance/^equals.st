comparing
= aSmaCCItemSet
	self class = aSmaCCItemSet class
		ifTrue:
			[type == #LALR1
				ifTrue: [^self isLALREqualTo: aSmaCCItemSet]
				ifFalse: [^self isLREqualTo: aSmaCCItemSet]].
	^false