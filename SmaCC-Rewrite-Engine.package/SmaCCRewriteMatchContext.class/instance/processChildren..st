private
processChildren: aCollection
	aCollection do: [:each | self processChild: each]