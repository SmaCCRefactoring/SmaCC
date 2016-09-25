accessing
pluralNames
	PluralNames isNil
		ifTrue:
			[ PluralNames := Dictionary new.
			PluralNames
				at: 's' put: 'ses';
				at: 'y' put: 'ies';
				at: 'x' put: 'xes';
				at: 'ch' put: 'ches' ].
	^ PluralNames