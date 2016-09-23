testing
isUsed
	^ (parent isKindOf: GstMessageSendNode)
		or: [ parent messages last == self and: [ parent isUsed ] ]