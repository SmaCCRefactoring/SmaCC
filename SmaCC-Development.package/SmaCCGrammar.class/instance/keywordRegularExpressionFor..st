private
keywordRegularExpressionFor: aString
	| regularExpressionString regex |
	regularExpressionString := (aString copyFrom: 2 to: aString size - 1)
		copyReplaceAll: '""'
		with: '"'.
	regex := regularExpressionString
		inject: nil
		into:
			[:sum :each | 
			sum isNil
				ifTrue: [SmaCCCharacterRENode characters: (String with: each)]
				ifFalse: [sum , (SmaCCCharacterRENode characters: (String with: each))]].
	regex addStates: scannerDefinition states.
	^regex