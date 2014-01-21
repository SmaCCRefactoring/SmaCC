private
isAlwaysAssigned: aString
	^((self modelTypesForVariable: aString) includes: (class model classFor: nil class))
		and:
			[self withAllSubclasses allSatisfy: [:sub | sub productions allSatisfy: [:each | each locallyDefinesVariable: aString]]]