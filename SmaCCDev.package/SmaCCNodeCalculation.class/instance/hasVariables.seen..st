private
hasVariables: aSmaCCSymbol seen: aSet
	aSmaCCSymbol requiresNodeType ifTrue: [^false].
	(aSet includes: aSmaCCSymbol) ifTrue: [^false].
	aSet add: aSmaCCSymbol.
	aSmaCCSymbol
		productionsDo:
			[:each | 
			each hasNamedVariable ifTrue: [^true].
			each do: [:symbol | (self hasVariables: symbol seen: aSet) ifTrue: [^true]]].
	^false