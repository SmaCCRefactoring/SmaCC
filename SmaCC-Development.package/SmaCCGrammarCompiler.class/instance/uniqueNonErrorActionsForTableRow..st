action
uniqueNonErrorActionsForTableRow: row
	^(row asSet)
		remove: 3 ifAbsent: [];
		asArray