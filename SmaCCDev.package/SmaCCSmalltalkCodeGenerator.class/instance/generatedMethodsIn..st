private
generatedMethodsIn: aRBClass
	^aRBClass selectors
		select:
			[:each | 
			(aRBClass protocolsFor: each)
				anySatisfy: [:protocol | protocol notNil and: ['generated*' match: protocol]]]