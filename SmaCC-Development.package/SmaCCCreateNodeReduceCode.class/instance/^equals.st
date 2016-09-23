comparing
= anObject
	^ super = anObject
		and:
			[ self classDefinition = anObject classDefinition
				and: [ self index = anObject index ] ]