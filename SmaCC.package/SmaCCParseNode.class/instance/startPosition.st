accessing
startPosition
	"Hackish way to get the minimum for all nodes. You might want to override to get a better implementation."

	| min doBlock |
	min := SmallInteger maximum.
	doBlock := [ :each | each startPosition ifNotNil: [ :pos | min := min min: pos ] ].
	self nodesDo: doBlock andTokensDo: doBlock.
	^ min