private
remove: aCollection 
	transitionObjects := transitionObjects 
				reject: [:each | self does: aCollection include: each]