private
getSubIndex: subIndex ofType: collectionType
	^generator cast: (generator argumentIndex: currentIndex subIndex: subIndex) to: collectionType