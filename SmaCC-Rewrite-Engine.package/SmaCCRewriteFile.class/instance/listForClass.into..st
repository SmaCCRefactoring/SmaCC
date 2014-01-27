accessing
listForClass: aClass into: aSmaCCRewriteLink
	^rewrites inject: aSmaCCRewriteLink into: [:sum :each | each listForClass: aClass into: sum]