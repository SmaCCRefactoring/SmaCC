accessing
transitions: aCollection
	transitions size
		to: 1
		by: -1
		do: [:i | transitions removeAt: i].
	transitions addAll: aCollection