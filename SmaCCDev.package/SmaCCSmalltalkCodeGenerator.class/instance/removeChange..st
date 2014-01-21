compiling
removeChange: aRBChange
	| index |
	index := self changes changes identityIndexOf: aRBChange.
	index > 0 ifFalse: [^self].
	self changes changes removeAtIndex: index