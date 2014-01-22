code
comment: aString
	^'"' , (aString trimBoth copyReplaceAll: '"' with: '""') , '"'