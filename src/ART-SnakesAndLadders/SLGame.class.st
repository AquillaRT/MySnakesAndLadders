Class {
	#name : 'SLGame',
	#superclass : 'Object',
	#instVars : [
		'tiles'
	],
	#category : 'ART-SnakesAndLadders',
	#package : 'ART-SnakesAndLadders'
}

{ #category : 'accessing' }
SLGame >> addPlayer: aPlayer [

	(self tileAt: 1) addPlayer: aPlayer.
	aPlayer position: 1
]

{ #category : 'printing' }
SLGame >> printOn: aStream [

	tiles do: [ :aTile | aTile printOn: aStream ]
]

{ #category : 'accessing' }
SLGame >> tileAt: anIndex [

	^ tiles at: anIndex
]

{ #category : 'as yet unclassified' }
SLGame >> tileFor: aPlayer atDistance: aNumber [

	^ self tileAt: (aPlayer position + aNumber)
]

{ #category : 'accessing' }
SLGame >> tileNumber [

	^ tiles size
]

{ #category : 'accessing' }
SLGame >> tileNumber: aNumber [

	tiles := (1 to: aNumber) collect: [ :i | SLTile new position: i ]
]
