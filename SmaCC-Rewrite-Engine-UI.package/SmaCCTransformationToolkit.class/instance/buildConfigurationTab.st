building
buildConfigurationTab
	| browser |
	(browser := self tabulator)
		title: 'Configuration';
		act: [ self loadConfiguration ] icon: GLMUIThemeExtraIcons glamorousOpen entitled: 'Load';
		act: [ self saveConfiguration ] icon: GLMUIThemeExtraIcons glamorousSave entitled: 'Save';
		act: [ self runAll ] icon: GLMUIThemeExtraIcons glamorousPlay entitled: 'Transform All';
		act: [ self setOutputDirectory ] entitled: 'Set output directory...';
		act: [ self selectInputParser ] entitled: 'Set Input Parser Class...';
		act: [ self selectValidationParser ] entitled: 'Set Validation Parser Class...';
		act: [ self setServer ] entitled: 'Set Server...';
		act: [ self setRunOnServer ] entitled: 'Run On Server...';
		act: [ self class new openOn: self entity ] entitled: 'Open another window';
		row: [ :row | 
			row
				column: #filesLabel size: 100;
				column: #files;
				column: #buttons size: 102 ];
		row: #results.
	browser transmit
		to: #filesLabel;
		andShow: [ :presentation | presentation label display: 'Files:' ].
	browser transmit
		to: #files;
		andShow: [ :presentation | 
			presentation fastList
				updateOn: #files from: [ self entity ifNotNil: [ self entity announcer ] ];
				beMultiple;
				display: [ :toolkit | toolkit files ];
				initialize: [ :list | list selection: self selectedFile ];
				selection: self selectedFile;
				enableFilter ].
	browser transmit
		from: #files port: #selection;
		to: #buttons port: #selection.
	browser transmit
		from: #files port: #selection;
		toOutsidePort: #selection.
	browser transmit
		to: #buttons;
		andShow: [ :presentation | 
			presentation actionList
				beVertical;
				act: [ self addDirectory ] icon: GLMUIThemeExtraIcons glamorousAdd entitled: 'Add Dir';
				act: [ self addFiles ] icon: GLMUIThemeExtraIcons glamorousAdd entitled: 'Add';
				act: [ :list | self removeFiles: (self fixSelection: list selection) ] icon: GLMUIThemeExtraIcons glamorousRemove entitled: 'Remove';
				act: [ :list | 
					list selection notEmpty
						ifTrue: [ self openResultFor: (self fixSelection: list selection) first ] ]
					icon: GLMUIThemeExtraIcons glamorousPlay
					entitled: 'Preview';
				act: [ :list | self runOn: (self fixSelection: list selection) ] icon: GLMUIThemeExtraIcons glamorousPlay entitled: 'Run' ].
	browser transmit
		to: #results;
		andShow: [ :presentation | 
			presentation fastTable
				display: [ self fileResults ];
				updateOn: ValueAdded from: [ self fileResults announcer ];
				updateOn: ValueRemoved from: [ self fileResults announcer ];
				column: 'File' evaluated: [ :each | each filename ];
				column: 'Error' evaluated: [ :each | each errorString ifNil: [ '' ] ];
				column: 'Transformation' evaluated: [ :each | each transformation ifNil: [ '' ] ifNotNil: [ :t | t displayString ] ];
				column: 'Line' evaluated: [ :each | each startLine ifNil: [ '' ] ];
				column: 'Column' evaluated: [ :each | each startColumn ifNil: [ '' ] ] ]