list
addSpecialFields: elements
	elements
		add:
			(DynamicEyeElement
				host: self object
				label: 'decompiled'
				description: [self object printString ]
				value: self decompiledParser);
		add:
			(DynamicEyeElement
				host: self object
				label: 'current token'
				description: [ self currentToken printString ]
				value: [ self object currentToken ]);
		add:
			(DynamicEyeElement
				host: self object
				label: 'error token'
				description: [ self errorToken printString ]
				value: [ self object errorToken ])