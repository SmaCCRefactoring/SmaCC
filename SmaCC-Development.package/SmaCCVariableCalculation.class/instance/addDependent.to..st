private
addDependent: dependentSmaCCRHS to: aSmaCCRHS
	(dependentsMap at: aSmaCCRHS ifAbsentPut: [IdentitySet new]) add: dependentSmaCCRHS