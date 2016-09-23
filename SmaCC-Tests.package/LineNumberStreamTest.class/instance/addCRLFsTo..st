private
addCRLFsTo: aString
	^ aString
		copyReplaceAll: '\'
		with: (String with: Character cr with: Character lf)