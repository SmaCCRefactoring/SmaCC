private
remove: aCollection
	transitionObjects := transitionObjects copy.
	transitionObjects smaccRemoveAll: aCollection