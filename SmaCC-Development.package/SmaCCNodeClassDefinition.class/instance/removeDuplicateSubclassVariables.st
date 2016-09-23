private-variables
removeDuplicateSubclassVariables
	variables
		do:
			[ :each | 
			self withAllSubclasses
				do:
					[ :sub | 
					sub == self
						ifFalse: [ sub removeInstanceVariable: each variableName ] ] ]