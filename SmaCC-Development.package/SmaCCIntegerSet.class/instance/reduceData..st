private
reduceData: myData
	^ myData isInteger
		ifTrue: [ myData ]
		ifFalse: [ myData first ]