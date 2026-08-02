Class {
	#name : 'SLTile',
	#superclass : 'Object',
	#instVars : [
		'position'
	],
	#category : 'ART-SnakesAndLadders',
	#package : 'ART-SnakesAndLadders'
}

{ #category : 'accessing' }
SLTile >> position: anInteger [ 
	position := anInteger
]

{ #category : 'printing' }
SLTile >> printOn: aStream [

	aStream << $[.
	position printOn: aStream.
	aStream << $]
]
