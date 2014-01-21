private
isSortedBefore: aSmaCCClassDefinition
	^self hierarchyCount < aSmaCCClassDefinition hierarchyCount
		or:
			[self hierarchyCount = aSmaCCClassDefinition hierarchyCount
				and: [self name < aSmaCCClassDefinition name]]