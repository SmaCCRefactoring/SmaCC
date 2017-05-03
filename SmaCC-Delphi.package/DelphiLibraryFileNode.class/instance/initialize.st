generated-initialize-release
initialize
	super initialize.
	semicolons := OrderedCollection new: 2.
	moduleNames := OrderedCollection new: 2.
	inTokens := OrderedCollection new: 2.
	filenames := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	exports := OrderedCollection new: 2.