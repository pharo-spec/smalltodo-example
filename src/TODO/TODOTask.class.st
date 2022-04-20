Class {
	#name : #TODOTask,
	#superclass : #Object,
	#instVars : [
		'done',
		'title'
	],
	#category : #TODO
}

{ #category : #accessing }
TODOTask class >> new [
	|instance|
	instance := super new.
	self tasks add: instance. 
	^ instance 
]

{ #category : #removing }
TODOTask class >> remove: aTODOTask [ 
	tasks remove: aTODOTask 
]

{ #category : #accessing }
TODOTask class >> reset [
	<script>
	tasks := OrderedCollection new.
]

{ #category : #accessing }
TODOTask class >> tasks [
	^ tasks ifNil: [ tasks := OrderedCollection new ]
]

{ #category : #accessing }
TODOTask >> done: aBoolean [
	done := aBoolean
]

{ #category : #initialization }
TODOTask >> initialize [

	super initialize.
	self done: false
]

{ #category : #testing }
TODOTask >> isDone [

	^ done
]

{ #category : #removing }
TODOTask >> remove [
	self class remove: self
]

{ #category : #accessing }
TODOTask >> title [
	^ title
]

{ #category : #accessing }
TODOTask >> title: aString [
	title := aString
]
