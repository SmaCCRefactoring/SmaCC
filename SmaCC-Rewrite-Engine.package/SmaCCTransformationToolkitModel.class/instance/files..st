accessing
files: aCollection
	files := aCollection.
	modified := true.
	self trigger: #files with: aCollection