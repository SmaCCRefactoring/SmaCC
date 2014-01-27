comparing
= anObject
	self class = anObject class ifFalse: [^false].
	^self filename = anObject filename