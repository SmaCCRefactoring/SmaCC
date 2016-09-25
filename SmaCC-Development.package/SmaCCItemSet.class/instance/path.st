accessing
path
	| result |
	result := OrderedCollection new.
	self pathInto: result.
	^ result