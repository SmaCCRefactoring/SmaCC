private
replace: anObject with: aString
	anObject isNil ifTrue: [^self].
	self delete: anObject.
	self insert: aString before: anObject