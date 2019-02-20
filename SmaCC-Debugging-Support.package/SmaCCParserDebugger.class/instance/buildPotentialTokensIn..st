building
buildPotentialTokensIn: browser
	browser transmit
		from: #stack port: #selection;
		to: #potential;
		transformed: [ :context | self potentialStateActions ];
		andShow: [ :composite | 
			composite table
				title: 'Possible Actions';
				column: 'Symbol' evaluated: [ :each | each first ];
				column: 'Action' evaluated: [ :each | each last ] ]