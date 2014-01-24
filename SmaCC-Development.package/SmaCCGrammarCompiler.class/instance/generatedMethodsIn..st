private
generatedMethodsIn: aRBClass 
	^aRBClass selectors select: 
			[:each | 
			(aRBClass protocolsFor: each) 
				allSatisfy: [:protocol | protocol notNil and: ['generated*' match: protocol]]]