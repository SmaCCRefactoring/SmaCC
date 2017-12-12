private
invertData: otherData
	otherData == 0
		ifTrue: [ ^ 1 ].
	otherData == 1
		ifTrue: [ ^ 0 ].
	^ (otherData isKindOf: ByteArray)
		ifTrue: [ otherData collect: [ :each | each bitInvert bitAnd: 16rFF ] ]
		ifFalse: [ otherData collect: [ :each | self invertData: each ] ]