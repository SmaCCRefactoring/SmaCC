accessing
children
	| result |
	result := OrderedCollection new.
	self nodesDo: [:each | each notNil ifTrue: [result add: each]].
	^result