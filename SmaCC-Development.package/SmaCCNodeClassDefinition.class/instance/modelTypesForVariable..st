private-variables
modelTypesForVariable: aVariableName
	| allTypes |
	allTypes := Set new.
	self withAllSubclasses
		do:
			[ :each | 
			each productions
				do:
					[ :production | allTypes addAll: (production modelTypesForVariable: aVariableName) ] ].
	^ allTypes