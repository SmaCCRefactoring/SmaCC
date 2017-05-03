accessing
addLocal: aString
	propertyNames add: aString.
	self changed: #locals