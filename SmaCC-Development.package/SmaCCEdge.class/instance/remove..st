private
remove: aCollection
	transitionObjects := transitionObjects
		reject: [ :each | aCollection includes: each ]