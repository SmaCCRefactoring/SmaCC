list
addSpecialFields: elements
	elements
		add:
			(AltDynamicEyeElement
				host: self object
				label: 'decompiled'
				description: [ self object printString ]
				value: self decompiledParser);
		add: (AltSmaCCStateStackElement host: self object);
		add: (AltSmaCCPotentialActionsElement host: self object);
		add:
			(AltDynamicEyeElement
				host: self object
				label: 'current token'
				description: [ self currentToken printString ]
				value: [ self object currentToken ]);
		add:
			(AltDynamicEyeElement
				host: self object
				label: 'error token'
				description: [ self errorToken printString ]
				value: [ self object errorToken ])