*smacc-debugging-support
gtAttributesIn: aComposite
	<gtInspectorPresentationOrder: 35>
	| tabulator |
	(attributes notNil and: [ attributes notEmpty ])
		ifFalse: [ ^ self ].
	tabulator := aComposite tabulator.
	tabulator
		title: 'Attributes';
		row: #attributes.
	tabulator transmit
		to: #attributes;
		andShow: [ :pres | 
			pres fastTable
				display: [ attributes keys asSortedCollection ];
				column: 'Name' evaluated: [ :each | each ];
				column: 'Value' evaluated: [ :each | self attributeNamed: each ifAbsent: [  ] ] ].
	tabulator transmit
		toOutsidePort: #selection;
		from: #attributes port: #selection;
		transformed: [ :name | self attributeNamed: name ifAbsent: [  ] ]