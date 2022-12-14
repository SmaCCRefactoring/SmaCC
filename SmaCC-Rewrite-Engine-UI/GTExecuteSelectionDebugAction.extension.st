Extension { #name : #GTExecuteSelectionDebugAction }

{ #category : #'*smacc-rewrite-engine-ui' }
GTExecuteSelectionDebugAction classSide >> gtTransformationActionFor: aDebugger [
	<gtContextSmaCCTransformationStack>
	^ (self forDebugger: aDebugger)
		codePresentationSelector: #rewriteCode;
		icon: GLMUIThemeExtraIcons glamorousInspect
]
