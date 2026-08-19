Class {
	#name : 'SLGame',
	#superclass : 'Object',
	#instVars : [
		'tiles',
		'players',
		'turn'
	],
	#category : 'ART-SnakesAndLadders',
	#package : 'ART-SnakesAndLadders'
}

{ #category : 'initial setup' }
SLGame >> addPlayer: aPlayer [

	(self tileAt: 1) addPlayer: aPlayer.
	aPlayer position: 1.
	players add: aPlayer 
]

{ #category : 'as yet unclassified' }
SLGame >> currentPlayer [

	| rest playerIndex |
	rest := turn \\ players size.
	playerIndex := rest isZero
		               ifTrue: [ players size ]
		               ifFalse: [ rest ].
	^ players at: playerIndex
]

{ #category : 'initialization' }
SLGame >> initialize [
	"protocol: 'initialization'"

	super initialize.
	players := OrderedCollection new.
	turn := 0
]

{ #category : 'game logic' }
SLGame >> movePlayer: aPlayer distance: anInteger [
	"Protocol: game logic"

	| targetTile |
	targetTile := self tileFor: aPlayer atDistance: anInteger.
	(self tileOfPlayer: aPlayer) releasePlayer: aPlayer.
	targetTile acceptPlayer: aPlayer
]

{ #category : 'printing' }
SLGame >> printOn: aStream [

	tiles do: [ :aTile | aTile printOn: aStream ]
]

{ #category : 'initial setup' }
SLGame >> setLadderFrom: aSourcePosition to: aTargetPosition [

	tiles 
		at: aSourcePosition 
		put: (SLLadderTile new
			 			position: aSourcePosition;
			 			to: (self tileAt: aTargetPosition))
]

{ #category : 'initial setup' }
SLGame >> setSnakeFrom: aSourcePosition to: aTargetPosition [
	"Protocol: configuring"

	tiles 
		at: aSourcePosition 
		put: (SLSnakeTile new
			 			position: aSourcePosition;
			 			to: (self tileAt: aTargetPosition))
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
