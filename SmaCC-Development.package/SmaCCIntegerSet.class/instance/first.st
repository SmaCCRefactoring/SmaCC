accessing
first
	self do: [ :each | ^ each ].
	self error: 'Collection is empty'