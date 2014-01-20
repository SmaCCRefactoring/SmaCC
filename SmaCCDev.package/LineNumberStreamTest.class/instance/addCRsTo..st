private
addCRsTo: aString 
	^aString copyReplaceAll: '\' with: (String with: Character cr)