action table
uniqueNonErrorActionsForTableRow: row
	^ row asSet
		remove: 3 ifAbsent: [  ];
		asArray