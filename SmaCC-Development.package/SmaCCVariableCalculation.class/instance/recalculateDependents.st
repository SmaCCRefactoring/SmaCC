private
recalculateDependents
	(dependentsMap at: currentRHS ifAbsent: [ #() ])
		do: [ :each | self addRHS: each ]