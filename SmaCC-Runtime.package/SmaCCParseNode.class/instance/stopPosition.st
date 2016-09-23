accessing
stopPosition
	"Hackish way to get the maximum for all nodes. You might want to override to get a better implementation."

	^ self
		attributeNamed: #stopPosition
		ifAbsentPut:
			[ | max doBlock |
			max := 0.
			doBlock := [ :each | each stopPosition ifNotNil: [ :pos | max := max max: pos ] ].
			self nodesDo: doBlock andTokensDo: doBlock.
			max ]