Class {
	#name : #TODOTaskPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'task',
		'titlePresenter'
	],
	#category : #TODO
}

{ #category : #actions }
TODOTaskPresenter >> accept [

	self task 
		title: titlePresenter text;
		save
]

{ #category : #initialization }
TODOTaskPresenter >> initializeDialogWindow: aDialogWindowPresenter [

	aDialogWindowPresenter 
		title: 'New task';
		initialExtent: 350@120;
		addButton: 'Accept' do: [ :dialog | 
			self accept.
			dialog close ];
		addButton: 'Cancel' do: [ :dialog |
			dialog close ]
]

{ #category : #initialization }
TODOTaskPresenter >> initializePresenters [

	titlePresenter := self newTextInput.

	self layout: (SpBoxLayout newVertical 
		add: titlePresenter;
		yourself).
]

{ #category : #accessing }
TODOTaskPresenter >> task [
	^ task
]

{ #category : #accessing }
TODOTaskPresenter >> task: aTask [
	task := aTask
]
