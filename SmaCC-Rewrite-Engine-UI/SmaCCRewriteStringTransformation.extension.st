Extension { #name : #SmaCCRewriteStringTransformation }

{ #category : #'*smacc-rewrite-engine-ui' }
SmaCCRewriteStringTransformation >> buildInterfaceIn: aPresentation [
	aPresentation text
		display: (self string ifNil: [ '' ]);
		title: 'Replacement Pattern';
		onChangeOfPort: #text act: [ :text | self string: text text asString ]
]

{ #category : #'*smacc-rewrite-engine-ui' }
SmaCCRewriteStringTransformation >> source [
	^ self string
]

{ #category : #'*smacc-rewrite-engine-ui' }
SmaCCRewriteStringTransformation classSide >> type [
	^ #String
]
