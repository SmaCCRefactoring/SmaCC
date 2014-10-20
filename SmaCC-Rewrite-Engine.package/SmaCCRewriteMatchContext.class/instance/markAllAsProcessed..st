processing
markAllAsProcessed: aCollection
	aCollection do: [ :each | self markAsProcessed: each ]