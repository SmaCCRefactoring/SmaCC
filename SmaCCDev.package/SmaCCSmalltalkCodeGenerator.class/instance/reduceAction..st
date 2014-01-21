code
reduceAction: anArray
	^'#(' , anArray first storeString , ' ' , (anArray at: 2) storeString , ' ' , anArray last storeString , ')'