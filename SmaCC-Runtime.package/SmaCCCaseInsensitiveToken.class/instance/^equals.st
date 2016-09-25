comparing
= aSmaCCToken
	^ self class = aSmaCCToken class
		and: [ self value sameAs: aSmaCCToken value ]