Extension { #name : #SmaCCTransformationToolkitModel }

{ #category : #'*smacc-rewrite-engine-ui' }
SmaCCTransformationToolkitModel >> changed: aSymbol [
	super changed: aSymbol.
	self announcer announce: aSymbol
]

{ #category : #'*smacc-rewrite-engine-ui' }
SmaCCTransformationToolkitModel >> changed: aSymbol with: anObject [
	super changed: aSymbol with: anObject.
	self announcer announce: aSymbol
]
