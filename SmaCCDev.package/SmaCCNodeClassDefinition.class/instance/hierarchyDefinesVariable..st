private
hierarchyDefinesVariable: aString
	^self withAllSubclasses anySatisfy: [:cls | cls instanceVariableNames includes: aString]