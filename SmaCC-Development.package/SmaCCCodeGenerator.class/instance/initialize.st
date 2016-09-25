initialize-release
initialize
	super initialize.
	reduceActionCache := Dictionary new.
	ambiguousActions := OrderedCollection new