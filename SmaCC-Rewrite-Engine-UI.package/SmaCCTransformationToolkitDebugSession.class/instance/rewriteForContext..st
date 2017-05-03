accessing
rewriteForContext: context
	^ context receiver rewriteEngine rewriteRule rewriteForMethod: context method