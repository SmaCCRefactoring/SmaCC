private
addLFsTo: aString 
	^aString copyReplaceAll: '\' with: (String with: Character lf)