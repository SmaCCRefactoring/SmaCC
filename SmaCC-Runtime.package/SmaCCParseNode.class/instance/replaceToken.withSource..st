source
replaceToken: aSmaCCToken withSource: aString
	self completeSource
		replaceFrom: aSmaCCToken startPosition
		to: aSmaCCToken stopPosition
		with: aString