testing
handlesContext: aContext
	^ (aContext findContextSuchThat: [ :each | self isTransformationContext: each ]) notNil