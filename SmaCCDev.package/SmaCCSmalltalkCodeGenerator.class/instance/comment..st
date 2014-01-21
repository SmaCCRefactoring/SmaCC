code
comment: aString
	^'"' , (aString trimBlanks copyReplaceAll: '"' with: '""') , '"'