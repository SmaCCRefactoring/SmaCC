comparing
= anObject
	^ self class = anObject class
		and:
			[ self index = anObject index
				and: [ self intervalId = anObject intervalId ] ]