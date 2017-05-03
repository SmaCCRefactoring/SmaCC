actions
addFiles: aCollection
	| files |
	files := Set withAll: self model files.
	files addAll: aCollection.
	self model files: files asSortedCollection asArray.
	self updateModel