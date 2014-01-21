private
hierarchyIncludes: aSmaCCClassDefinition
	^self = aSmaCCClassDefinition or: [superclass notNil and: [superclass hierarchyIncludes: aSmaCCClassDefinition]]