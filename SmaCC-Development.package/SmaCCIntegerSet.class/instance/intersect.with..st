private
intersect: myData with: otherData
	| value includeNone |
	(myData == 0 or: [ otherData == 1 ])
		ifTrue: [ ^ myData ].
	(myData == 1 or: [ otherData == 0 ])
		ifTrue: [ ^ self copyData: otherData ].
	includeNone := true.
	(myData isKindOf: ByteArray)
		ifTrue: [ 1 to: myData size do: [ :i | 
				myData at: i put: (value := (myData at: i) bitAnd: (otherData at: i)).
				includeNone := includeNone and: [ value == 0 ] ] ]
		ifFalse: [ 1 to: myData size do: [ :i | 
				myData at: i put: (value := self intersect: (myData at: i) with: (otherData at: i)).
				includeNone := includeNone and: [ value == 0 ] ] ].
	includeNone
		ifTrue: [ ^ 0 ].
	^ myData