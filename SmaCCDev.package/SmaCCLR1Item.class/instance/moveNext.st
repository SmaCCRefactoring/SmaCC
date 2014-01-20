accessing
moveNext
	^(self copy)
		followers: (followers class basedOn: followers);
		location: location + 1;
		yourself