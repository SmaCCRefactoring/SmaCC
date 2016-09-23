action table
compressTableRow: row
	| uniqueItems |
	uniqueItems := self uniqueNonErrorActionsForTableRow: row.
	^ uniqueItems size = 1
		ifTrue: [ self
				singleActionTableRow: row
				forAction: uniqueItems first ]
		ifFalse: [ self multipleActionTableRow: row ]