accessing
removeLocal: aString
	propertyNames remove: aString ifAbsent: [  ].
	self changed: #locals