private
compareByte: myByte to: otherByte hasMore: aBlock
	| mine other |
	myByte == otherByte
		ifTrue: [ ^ 0 ].
	myByte == 0
		ifTrue: [ ^ (aBlock value: true)
				ifTrue: [ 1 ]
				ifFalse: [ -1 ] ].
	otherByte == 0
		ifTrue: [ ^ (aBlock value: false)
				ifTrue: [ -1 ]
				ifFalse: [ 1 ] ].
	mine := myByte.
	other := otherByte.
	[ mine odd = other odd ]
		whileTrue: [ mine := mine bitShift: -1.
			other := other bitShift: -1 ].
	^ mine odd
		ifTrue: [ (other ~~ 0 or: [ aBlock value: false ])
				ifTrue: [ -1 ]
				ifFalse: [ 1 ] ]
		ifFalse: [ (mine ~~ 0 or: [ aBlock value: true ])
				ifTrue: [ 1 ]
				ifFalse: [ -1 ] ]