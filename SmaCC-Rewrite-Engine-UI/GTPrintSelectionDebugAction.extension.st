Extension { #name : #GTPrintSelectionDebugAction }

{ #category : #'*smacc-rewrite-engine-ui' }
GTPrintSelectionDebugAction classSide >> gtTransformationActionFor: aDebugger [
	<gtContextSmaCCTransformationStack>
	^ (self forDebugger: aDebugger)
		codePresentationSelector: #rewriteCode;
		icon: GLMUIThemeExtraIcons glamorousInspect
]
