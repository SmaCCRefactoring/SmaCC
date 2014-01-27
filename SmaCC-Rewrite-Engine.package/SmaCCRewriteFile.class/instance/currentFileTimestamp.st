accessing
currentFileTimestamp
	^ filename ifNotNil: [ :name | name modificationTime ]