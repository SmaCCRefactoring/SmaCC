comparing
= anObject
	^self class = anObject class
		and:
			[self nodeClass = anObject nodeClass
				and: [self nodeInterval = anObject nodeInterval and: [self rewrite = anObject rewrite]]]