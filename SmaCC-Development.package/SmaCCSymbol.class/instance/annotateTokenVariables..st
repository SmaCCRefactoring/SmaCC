private
annotateTokenVariables: aBlock
	self productionsDo: [ :each | each annotateTokenVariables: aBlock ]