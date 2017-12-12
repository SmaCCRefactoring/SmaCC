private
merge: myData with: otherData
	| value includeAll |
	(myData == 0 or: [ otherData == 1 ])
		ifTrue: [ ^ otherData ].
	(myData == 1 or: [ otherData == 0 ])
		ifTrue: [ ^ myData ].
	includeAll := true.
	(myData isKindOf: ByteArray)
		ifTrue: [ 1 to: myData size do: [ :i | 
				myData at: i put: (value := (myData at: i) bitOr: (otherData at: i)).
				includeAll := includeAll and: [ value == 255 ] ] ]
		ifFalse: [ 1 to: myData size do: [ :i | 
				myData at: i put: (value := self merge: (myData at: i) with: (otherData at: i)).
				includeAll := includeAll and: [ value == 1 ] ] ].
	includeAll
		ifTrue: [ ^ 1 ].
	^ myData