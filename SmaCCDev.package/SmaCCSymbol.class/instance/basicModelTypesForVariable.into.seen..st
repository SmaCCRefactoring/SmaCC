private
basicModelTypesForVariable: aString into: productionTypes seen: aSet
	self productionsDo: [:each | productionTypes addAll: (each modelTypesForVariable: aString seen: aSet)]