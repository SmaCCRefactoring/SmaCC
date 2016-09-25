instance creation
from: aSmaCCIndex to: aSmaCCIndex2 string: aString
	^ self new
		start: aSmaCCIndex;
		stop: aSmaCCIndex2;
		string: aString;
		yourself