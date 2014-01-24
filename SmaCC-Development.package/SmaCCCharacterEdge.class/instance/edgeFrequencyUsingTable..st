compiling
edgeFrequencyUsingTable: frequencyTable 
	^self transitionObjects inject: 0
		into: [:sum :each | sum + (frequencyTable at: each asInteger \\ frequencyTable size + 1)]