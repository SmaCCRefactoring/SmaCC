private
computeVariableDefinitions
	| variableCollections |
	variableCollections := OrderedCollection new.
	self productionsDo: [:each | variableCollections add: each variableDefinitions].
	variableDefinitions := self class mergeOrderedVariableDefinitions: variableCollections.
	SmaCCVariableDefinition assignIndices: variableDefinitions.
	^variableDefinitions