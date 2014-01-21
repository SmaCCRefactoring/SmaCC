accessing
commonSuperclass: aSmaCCClassDefinition
	(aSmaCCClassDefinition hierarchyIncludes: self) ifTrue: [^self].
	superclass isNil ifTrue: [^nil].
	^superclass commonSuperclass: aSmaCCClassDefinition