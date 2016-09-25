building
actionsAndSymbolsFor: aByteArray do: aBlock
	| action |
	(aByteArray at: 1) = 0
		ifTrue:
			[ action := ((aByteArray at: 2) bitShift: 8) + (aByteArray at: 3).
			4 to: aByteArray size by: 2 do: [ :i | aBlock value: action value: ((aByteArray at: i) bitShift: 8) + (aByteArray at: i + 1) ] ]
		ifFalse:
			[ 2 to: aByteArray size by: 4 do:
				[ :i | 
				aBlock
					value: ((aByteArray at: i) bitShift: 8) + (aByteArray at: i + 1)
					value: ((aByteArray at: i + 2) bitShift: 8) + (aByteArray at: i + 3) ] ]