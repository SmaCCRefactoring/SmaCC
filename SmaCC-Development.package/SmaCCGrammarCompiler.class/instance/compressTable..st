action table
compressTable: table
	^ table collect: [ :row | self compressTableRow: row ]