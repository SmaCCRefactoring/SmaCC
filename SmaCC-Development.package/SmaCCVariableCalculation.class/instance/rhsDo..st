private
rhsDo: aBlock
	grammar symbols
		do: [ :each | 
			each isStartingSymbol
				ifFalse: [ each productionsDo: aBlock ] ]