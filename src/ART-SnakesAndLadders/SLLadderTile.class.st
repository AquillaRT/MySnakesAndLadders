Class {
	#name : 'SLLadderTile',
	#superclass : 'SLActiveTile',
	#category : 'ART-SnakesAndLadders',
	#package : 'ART-SnakesAndLadders'
}

{ #category : 'printing' }
SLLadderTile >> printInsideOn: aStream [

	aStream
		<< position asString;
		<< '->';
		<< targetTile position asString

]
