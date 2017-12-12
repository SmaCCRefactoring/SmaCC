private
removeData: otherData from: myData
	| includeNone value |
	(myData == 0 or: [ otherData == 1 ])
		ifTrue: [ ^ 0 ].
	otherData == 0
		ifTrue: [ ^ myData ].
	myData = 1
		ifTrue: [ ^ self invertData: otherData ].
	includeNone := true.
	(myData isKindOf: ByteArray)
		ifTrue: [ 1 to: myData size do: [ :i | 
				myData at: i put: (value := (myData at: i) bitAnd: (otherData at: i) bitInvert).
				includeNone := includeNone and: [ value == 0 ] ] ]
		ifFalse: [ 1 to: myData size do: [ :i | 
				myData at: i put: (value := self removeData: (otherData at: i) from: (myData at: i)).
				includeNone := includeNone and: [ value == 0 ] ] ].
	includeNone
		ifTrue: [ ^ 0 ].
	^ myData