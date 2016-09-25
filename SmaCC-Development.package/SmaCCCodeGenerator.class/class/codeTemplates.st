code generation templates
codeTemplates
	^ codeTemplates
		ifNil:
			[ codeTemplates := IdentityDictionary new.
			self codeTemplatesArray
				do: [ :each | codeTemplates at: each first put: each last ].
			codeTemplates ]