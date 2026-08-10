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

{ #category : 'accessing' }
SLGame >> movePlayer: aPlayer distance: anInteger [

	| targetTile |
	targetTile := self tileFor: aPlayer atDistance: anInteger.
	(self tileOfPlayer: aPlayer) removePlayer: aPlayer.
	targetTile addPlayer: aPlayer.
	aPlayer position: targetTile position
]

{ #category : 'printing' }
SLGame >> printOn: aStream [

	tiles do: [ :aTile | aTile printOn: aStream ]
]

{ #category : 'accessing' }
SLGame >> tileAt: anIndex [

	^ tiles at: anIndex
]

{ #category : 'accessing' }
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

{ #category : 'accessing' }
SLGame >> tileOfPlayer: aPlayer [

	^ self tileAt: aPlayer position
]
