accessing
currentFileTimestamp
	^ filename
		ifNotNil: [ :name | name asFileReference modificationTime ]