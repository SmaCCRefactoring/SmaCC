private
variableDefinitionInHierarchyNamed: aString do: aBlock
	self withAllSubclasses do: [:cls | (cls variableDefinitionNamed: aString) ifNotNil: aBlock]