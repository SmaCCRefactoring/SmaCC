accessing
rhsDo: aBlock
	self symbols do: [:each | each productionsDo: aBlock]