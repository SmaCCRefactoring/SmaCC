comparing
= anObject
	^ self == anObject
		or:
			[ self class = anObject class
				and:
					[ self variableSelectors
						allSatisfy:
							[ :symbol | 
							(self perform: symbol)
								allSatisfy: [ :each | (self perform: each) = (anObject perform: each) ] ] ] ]