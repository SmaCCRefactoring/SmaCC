private
createMessageNodeFrom: aCollection
	^ RBMessageNode
		receiver: aCollection first
		selector: (aCollection at: 2) first contents asSymbol
		arguments: (aCollection at: 2) last