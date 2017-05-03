actions
debugUsingSeachBlock: searchBlock andTransformationBlock: transformationBlock
	SmaCCRewriteMatch haltBlock: searchBlock.
	SmaCCRewriteTransformation haltBlock: transformationBlock.
	[ self openResultFor: self selectedFile ]
		ensure: [ SmaCCRewriteMatch haltBlock: nil.
			SmaCCRewriteTransformation haltBlock: nil ]