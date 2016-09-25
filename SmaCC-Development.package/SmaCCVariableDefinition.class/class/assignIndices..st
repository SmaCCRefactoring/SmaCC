accessing
assignIndices: aCollection
	aCollection keysAndValuesDo: [ :index :each | each index: index ]