accessing
previewResultHolder
	^ previewResult ifNil: [ previewResult := NewValueHolder value: SmaCCRewriteCompleteResult new ]