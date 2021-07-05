"
GtkMenuButton
GtkMenuButton — A widget that shows a popup when clicked on

https://developer.gnome.org/gtk3/unstable/GtkMenuButton.html
"
Class {
	#name : #GtkMenuButton,
	#superclass : #GtkToggleButton,
	#instVars : [
		'popover',
		'popup'
	],
	#pools : [
		'GtkArrowType'
	],
	#category : #'Gtk-Widget-Buttons'
}

{ #category : #private }
GtkMenuButton class >> buttonNew [

	^ self ffiCall: #(GtkMenuButton *gtk_menu_button_new (void))
]

{ #category : #private }
GtkMenuButton class >> buttonNewWithLabel: utf8EncodedString [

	self shouldNotImplement
]

{ #category : #example }
GtkMenuButton class >> example [
	| button menu |

	GtkEngine ensureRunning.
	
	(button := (GtkButton newLabel: 'Choose...'))
		connectClicked: [ self inform: button label ].
		
	menu := GtkMenu new.
	#('One' 'Two' 'Three') do: [ :each | | menuItem |
		menuItem := GtkMenuItem newLabel: each.
		menuItem connectActivate: [ button label: each ].
		menu add: menuItem ].
	menu showAll.
	
	GtkWindow new
		title: 'Menu Button Example';
		add: (GtkBox newVertical
			homogeneous: false; 
			packStart: (GtkBox newHorizontal
				homogeneous: false;
				packStart: button 
					expand: false
					fill: false
					padding: 0;
				packStart: (GtkMenuButton new
						popup: menu;
						yourself)
					expand: false
					fill: false
					padding: 0;
				yourself)
			expand: false 
			fill: false
			padding: 0;
			yourself);
		showAll
]

{ #category : #accessing }
GtkMenuButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_menu_button_get_type())
]

{ #category : #accessing }
GtkMenuButton >> alignMenuWithWidget: aWidget [

	^ self ffiCall: #(void gtk_menu_button_set_align_widget (self, GtkWidget *aWidget))
]

{ #category : #accessing }
GtkMenuButton >> bePopupDirectionDown [

	self popupDirection: GTK_ARROW_DOWN
]

{ #category : #accessing }
GtkMenuButton >> bePopupDirectionLeft [

	self popupDirection: GTK_ARROW_LEFT
]

{ #category : #accessing }
GtkMenuButton >> bePopupDirectionNone [

	self popupDirection: GTK_ARROW_NONE
]

{ #category : #accessing }
GtkMenuButton >> bePopupDirectionRight [

	self popupDirection: GTK_ARROW_RIGHT
]

{ #category : #accessing }
GtkMenuButton >> bePopupDirectionUp [

	self popupDirection: GTK_ARROW_UP
]

{ #category : #private }
GtkMenuButton >> getPopover [

	^ self ffiCall: #(GtkPopover *gtk_menu_button_get_popover (self))
]

{ #category : #private }
GtkMenuButton >> getPopup [

	^ self ffiCall: #(GtkMenu *gtk_menu_button_get_popup (self))
]

{ #category : #accessing }
GtkMenuButton >> menuModel [

	^ self ffiCall: #(GMenuModel *gtk_menu_button_get_menu_model (self))
]

{ #category : #accessing }
GtkMenuButton >> menuModel: aMenuModel [
	self halt: #doNotUse.
	"We do not have menu models implemented.
	Also, we should keep track of children"
	self ffiCall: #(void gtk_menu_button_set_menu_model (self, GtkMenu *aMenuModel))
]

{ #category : #private }
GtkMenuButton >> menuPopup: aMenu widgetGravity: widgetGavity menuGravity: menuGravity [

	^ self ffiCall: #(void gtk_menu_popup_at_widget (GtkMenu *aMenu, self, GdkGravity widgetGavity, GdkGravity menuGravity, NULL))
]

{ #category : #accessing }
GtkMenuButton >> popover [

	^ popover ifNil: [ popover := self getPopover ]
]

{ #category : #accessing }
GtkMenuButton >> popover: aPopover [

	popover := aPopover.
	self setPopover: aPopover
]

{ #category : #accessing }
GtkMenuButton >> popup [

	^ popup ifNil: [ popup := self getPopup ]
]

{ #category : #accessing }
GtkMenuButton >> popup: aMenu [

	popup := aMenu.
	self setPopup: aMenu
]

{ #category : #accessing }
GtkMenuButton >> popupDirection [

	^ self ffiCall: #(GtkArrowType gtk_menu_button_get_direction (self))
]

{ #category : #private }
GtkMenuButton >> popupDirection: direction [

	^ self ffiCall: #(void gtk_menu_button_set_direction (self, GtkArrowType direction))
]

{ #category : #private }
GtkMenuButton >> setPopover: aPopover [

	self ffiCall: #(void gtk_menu_button_set_popover (self, GtkPopover *aPopover))
]

{ #category : #private }
GtkMenuButton >> setPopup: aMenu [

	self ffiCall: #(void gtk_menu_button_set_popup (self, GtkMenu *aMenu))
]

{ #category : #accessing }
GtkMenuButton >> usePopover: aBoolean [

	^ self ffiCall: #(void gtk_menu_button_set_use_popover (self, gboolean aBoolean))
]

{ #category : #testing }
GtkMenuButton >> usesPopover [

	^ self ffiCall: #(gboolean gtk_menu_button_get_use_popover (self))
]

{ #category : #accessing }
GtkMenuButton >> widgetAlignedWithMenu [

	^ self ffiCall: #(GtkWidget *gtk_menu_button_get_align_widget (self))
]
