action
compressTable: table
	^table collect: [:row | self compressTableRow: row]