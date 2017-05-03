building
buildGLRTransmissionsIn: browser
	self isGLR
		ifTrue:
			[ browser transmit
				from: #stack port: #selection;
				to: #glrStates;
				transformed: [ :context | self glrParserStates ];
				andShow:
						[ :composite | 
					composite table
						title: 'GLR';
						format:
								[ :each | (self session parser states identityIndexOf: each) printString ] ] ]