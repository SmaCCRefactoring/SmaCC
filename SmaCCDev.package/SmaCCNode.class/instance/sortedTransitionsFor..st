compiling
sortedTransitionsFor: aClass 
	| frequencies |
	frequencies := (aClass realClass ifNil: [SmaCCScanner]) frequencyTable.
	^transitions asSortedCollection: 
			[:a :b | 
			| aFrequency bFrequency |
			aFrequency := a edgeFrequencyUsingTable: frequencies.
			bFrequency := b edgeFrequencyUsingTable: frequencies.
			aFrequency > bFrequency or: [aFrequency = bFrequency and: [a <= b]]]