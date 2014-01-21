private
isLREqualTo: anItemSet
	^anItemSet size = self size
		and:
			[self
				allSatisfy:
					[:each | 
					| item |
					(item := anItemSet itemFor: each) notNil and: [each isLR1EqualTo: item]]]