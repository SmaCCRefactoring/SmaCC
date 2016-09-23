initialize-release
initialize
	super initialize.
	id := self getId.
	transitions := SortedCollection new