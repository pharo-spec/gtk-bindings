"
GtkMenuButton
GtkMenuButton — A widget that shows a popup when clicked on

https://developer.gnome.org/gtk3/unstable/GtkMenuButton.html
"
Class {
	#name : #GtkMenuButton,
	#superclass : #GtkButton,
	#instVars : [
		'popover',
		'model'
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
		
	
	"All entries will be disabled because there is no real action associated"
	menu := GMenu new.
	#('One' 'Two' 'Three') do: [ :each | 
		menu 
			appendLabel: each 
			action: 'action.', each ].
	
	GtkWindow new
		title: 'Menu Button Example';
		add: (GtkBox newVertical
			homogeneous: false; 
			append: (GtkBox newHorizontal
				homogeneous: false;
				append: button;
				append: (GtkMenuButton new
					menuModel: menu;
					yourself);
				yourself)
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
GtkMenuButton >> getChild [

	self ffiCall: #(GtkWidget *gtk_menu_button_get_child (self))
]

{ #category : #private }
GtkMenuButton >> getLabel [

	^ self ffiCall: #(const char* gtk_menu_button_get_label (self))
]

{ #category : #private }
GtkMenuButton >> getMenuModel [

	^ self ffiCall: #(GMenuModel *gtk_menu_button_get_menu_model (self))
]

{ #category : #private }
GtkMenuButton >> getPopover [

	^ self ffiCall: #(GtkPopover *gtk_menu_button_get_popover (self))
]

{ #category : #accessing }
GtkMenuButton >> menuModel [

	^ model ifNil: [ model := self getMenuModel ]
]

{ #category : #accessing }
GtkMenuButton >> menuModel: aMenuModel [

	model := aMenuModel.
	self setMenuModel: model
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

	^ self ffiCall: #(void gtk_menu_button_popup (self))
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
GtkMenuButton >> setLabel: label [

	self ffiCall: #(void gtk_menu_button_set_label (self, const char* label))
]

{ #category : #private }
GtkMenuButton >> setMenuModel: aMenuModel [

	"We do not have menu models implemented.
	Also, we should keep track of children"
	self ffiCall: #(void gtk_menu_button_set_menu_model (self, GMenuModel *aMenuModel))
]

{ #category : #private }
GtkMenuButton >> setPopover: aPopover [

	self ffiCall: #(void gtk_menu_button_set_popover (self, GtkPopover *aPopover))
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
