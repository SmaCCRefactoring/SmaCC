code generation templates
comment: aString
	^ '"' , (aString trim copyReplaceAll: '"' with: '""') , '"'