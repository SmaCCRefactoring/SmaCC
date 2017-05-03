generated-initialize-release
initialize
	super initialize.
	indexes := OrderedCollection new: 2.
	readers := OrderedCollection new: 2.
	writers := OrderedCollection new: 2.
	defaults := OrderedCollection new: 2.
	storeds := OrderedCollection new: 2.
	implementses := OrderedCollection new: 2.
	dispids := OrderedCollection new: 2.