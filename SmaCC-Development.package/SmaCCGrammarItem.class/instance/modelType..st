private
modelType: anIdentitySet
	| types |
	types := self modelTypes: anIdentitySet.
	^self grammar codeGenerator commonSupertypeOf: types