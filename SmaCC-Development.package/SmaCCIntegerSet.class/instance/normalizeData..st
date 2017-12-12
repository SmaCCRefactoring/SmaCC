private
normalizeData: oldData
	| value allAreIntegers |
	(oldData isKindOf: ByteArray)
		ifTrue: [ value := oldData first.
			(value == 0 or: [ value == 255 ])
				ifFalse: [ ^ oldData ].
			2 to: oldData size do: [ :i | 
				(oldData at: i) = value
					ifFalse: [ ^ oldData ] ].
			^ value == 255
				ifTrue: [ 1 ]
				ifFalse: [ 0 ] ].
	(oldData isKindOf: Array)
		ifTrue: [ allAreIntegers := true.
			1 to: oldData size do: [ :i | 
				oldData at: i put: (value := self normalizeData: (oldData at: i)).
				allAreIntegers := allAreIntegers and: [ value isInteger ] ].
			allAreIntegers
				ifTrue: [ (oldData allSatisfy: [ :each | each = value ])
						ifTrue: [ ^ value ] ] ].
	^ oldData