accessing
undefinedItems: aCollection
	undefinedItems := Set withAll: (aCollection collect: [ :each | each asUppercase ])