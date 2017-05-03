private
codeObjectForSelection: anArray
	(anArray first isKindOf: SmaCCRewriteMethodDefinition)
		ifTrue: [ ^ anArray first ].
	^ (self isTransformation: anArray)
		ifTrue: [ anArray first transformation ]
		ifFalse: [ anArray first match ]