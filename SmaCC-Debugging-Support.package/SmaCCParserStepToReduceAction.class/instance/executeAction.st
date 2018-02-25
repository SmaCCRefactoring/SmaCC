accessing
executeAction
	| selectors |
	selectors := self session parser reduceTable
		inject: Set new
		into: [ :sum :each | 
			sum
				add: each last;
				yourself ].
	self
		stepUntil: [ :context | 
			(context
				findContextSuchThat:
					[ :each | (each receiver isKindOf: SmaCCParser) and: [ each selector = #parse ] ])
				isNil
				or: [ (context
						findContextSuchThat: [ :each | 
							(each receiver isKindOf: SmaCCParser)
								and: [ selectors includes: each selector ] ]) notNil ] ]