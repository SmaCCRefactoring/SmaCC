Extension { #name : #ResumeDebugAction }

{ #category : #'*smacc-rewrite-engine-ui' }
ResumeDebugAction class >> gtSmaCCTransformationStackActionFor: aDebugger [
	<gtSmaCCTransformationStack>
	^ (self forDebugger: aDebugger) icon: GLMUIThemeExtraIcons glamorousPlay
]
