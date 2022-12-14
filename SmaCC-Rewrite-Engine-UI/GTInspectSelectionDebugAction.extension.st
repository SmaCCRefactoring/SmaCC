Extension { #name : #GTInspectSelectionDebugAction }

{ #category : #'*smacc-rewrite-engine-ui' }
GTInspectSelectionDebugAction classSide >> gtTransformationActionFor: aDebugger [
	<gtContextSmaCCTransformationStack>
	^ (self forDebugger: aDebugger)
		codePresentationSelector: #rewriteCode;
		icon: GLMUIThemeExtraIcons glamorousInspect
]
