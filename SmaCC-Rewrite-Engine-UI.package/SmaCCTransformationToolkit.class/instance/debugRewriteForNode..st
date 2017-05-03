actions
debugRewriteForNode: selection
	self
		debugUsingSeachBlock: nil
		andTransformationBlock: [ :rewrite :node | 
			rewrite == selection rewrite
				and: [ node class == selection nodeClass
						and: [ node startPosition = selection nodeInterval first
								and: [ node stopPosition = selection nodeInterval last ] ] ] ]