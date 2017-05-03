*smacc-rewrite-engine-ui
buildInterfaceIn: aPresentation
	| updating |
	updating := false.
	aPresentation pharoScript
		display: (self code ifNil: [ '' ]);
		title: 'Code';
		smalltalkClass: [ rewrite contextClass ];
		onChangeOfPort: #text
			act: [ :text | 
			updating
				ifFalse: [ self code: text text asString ] ];
		morphicSelectionAct: [ :text | 
				self code: (RBParser parseExpression: text text asString) formattedCode.
				updating := true.
				[ text update ]
					ensure: [ updating := false ] ]
			icon: GLMUIThemeExtraIcons glamorousPlay
			on: $t
			entitled: 'Format'