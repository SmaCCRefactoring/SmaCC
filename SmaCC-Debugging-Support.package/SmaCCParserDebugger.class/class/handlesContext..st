testing
handlesContext: aContext
	^ (aContext findContextSuchThat: [ :each | self isParseContext: each ]) notNil