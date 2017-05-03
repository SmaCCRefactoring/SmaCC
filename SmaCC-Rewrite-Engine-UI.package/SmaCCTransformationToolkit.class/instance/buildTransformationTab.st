building
buildTransformationTab
	self dynamic
		title: 'Transformations';
		act: [ :p | self loadRewrites ] icon: GLMUIThemeExtraIcons glamorousOpen entitled: 'Load';
		act: [ :p | self saveRewrites ] icon: GLMUIThemeExtraIcons glamorousSave entitled: 'Save';
		presentation: [ :presentation :each | 
			presentation
				custom:
					(SmaCCRewriteEditor new
						treeInitializer: [ :tree | 
							tree
								morphicSelectionAct: [ :presenter | self debugRewrite: presenter selection ]
								icon: GLMUIThemeExtraIcons glamorousBug
								on: $d
								entitled: 'Debug' ];
						transformation: [ :e | self model rewrites ];
						entity: self model rewrites;
						yourself) ]