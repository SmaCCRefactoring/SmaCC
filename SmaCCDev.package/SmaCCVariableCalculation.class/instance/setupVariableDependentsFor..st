private
setupVariableDependentsFor: aSmaCCRHS
	aSmaCCRHS unnamedSymbolsDo: [:symbol | symbol productionsDo: [:rhs | self addDependent: aSmaCCRHS to: rhs]]