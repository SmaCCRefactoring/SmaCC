private
compareData: myData to: otherData hasMore: aBlock
	| value |
	myData == 0
		ifTrue: [ otherData == 0
				ifTrue: [ ^ 0 ].
			^ (aBlock value: true)
				ifTrue: [ 1 ]
				ifFalse: [ -1 ] ].
	myData == 1
		ifTrue: [ otherData == 1
				ifTrue: [ ^ 0 ].
			otherData == 0
				ifTrue: [ ^ (aBlock value: false)
						ifTrue: [ -1 ]
						ifFalse: [ 1 ] ].
			^ ((self endsWithZeros: otherData) and: [ (aBlock value: false) not ])
				ifTrue: [ 1 ]
				ifFalse: [ -1 ] ].
	otherData == 0
		ifTrue: [ ^ (aBlock value: false)
				ifTrue: [ -1 ]
				ifFalse: [ 1 ] ].
	otherData == 1
		ifTrue: [ ^ ((self endsWithZeros: myData) and: [ (aBlock value: true) not ])
				ifTrue: [ -1 ]
				ifFalse: [ 1 ] ].
	(myData isKindOf: ByteArray)
		ifTrue: [ 1 to: myData size do: [ :i | 
				value := self
					compareByte: (myData at: i)
					to: (otherData at: i)
					hasMore: [ :isMine | 
						(self
							hasMore:
								(isMine
									ifTrue: [ myData ]
									ifFalse: [ otherData ])
							after: i) or: [ aBlock value: isMine ] ].
				value ~~ 0
					ifTrue: [ ^ value ] ] ]
		ifFalse: [ 1 to: myData size do: [ :i | 
				value := self
					compareData: (myData at: i)
					to: (otherData at: i)
					hasMore: [ :isMine | 
						(self
							hasMore:
								(isMine
									ifTrue: [ myData ]
									ifFalse: [ otherData ])
							after: i) or: [ aBlock value: isMine ] ].
				value ~~ 0
					ifTrue: [ ^ value ] ] ].
	^ 0