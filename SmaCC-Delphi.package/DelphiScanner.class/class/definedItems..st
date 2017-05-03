accessing
definedItems: aCollection
	definedItems := Set withAll: (aCollection collect: [ :each | each asUppercase ])