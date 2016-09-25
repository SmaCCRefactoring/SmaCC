accessing
processAllNotifying: postBlock
	self files do: [ :each | postBlock value: (self processFile: each) ]