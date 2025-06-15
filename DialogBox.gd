extends Node2D

## Character sprite displayed during dialogue
@export var speaker: Texture
## Speaker's name shown in the dialogue box
@export var speaker_name: String
## Background texture for dialogue windows
@export var background: Texture
## Primary font for regular text
@export var normal_font: FontFile
## Monospaced font for code/technical messages
@export var mono_font: FontFile
## Italic font for emphasized text
@export var italics_font: FontFile
## Bold italic font for special emphasis
@export var bold_italics_font: FontFile
## Bold font for headers/keywords
@export var bold_font: FontFile
## Text reveal speed (higher = faster)
@export var opentext_speed: float = 0.25

# Node references
@onready var text: RichTextLabel = $CanvasLayer/Control/Background/Text
@onready var nametext: Label = $CanvasLayer/Control/Background/NameLabel
@onready var back_sprite: Sprite2D = $CanvasLayer/Control/Background
@onready var _speaker: Sprite2D = $CanvasLayer/Control/Background/Speaker

# Dialog control buttons
@onready var end: Button = $CanvasLayer/Control/Background/end
@onready var yes: Button = $CanvasLayer/Control/Background/yes
@onready var no: Button = $CanvasLayer/Control/Background/no
@onready var next: Button = $CanvasLayer/Control/Background/next

# Dialog state variables
var open_speed = 0.1  # Current text reveal speed
var dialog_on = false # Dialog visibility flag
var npc_dia = 1       # Dialog type (1=end, 2=next, 3=choice)
var dialog_moment = 1 # Dialog progress tracker

func _ready() -> void:
	# Initialize dialog as hidden
	back_sprite.visible = false
	# Start with text fully hidden
	text.visible_ratio = 0

func _process(delta):
	# Update UI elements each frame
	assigning_values()
	# Toggle dialog based on state
	if dialog_on == true:
		dialog()
	else:
		dialog_off()

# Assign dynamic values to UI components
func assigning_values():
	# Set character sprite if not already set
	if _speaker.texture == null:
		_speaker.texture = speaker
	# Set speaker name (with translation support)
	if nametext.text == "":
		nametext.text = tr(speaker_name)

# Main dialog display logic
func dialog(dialog_key: String = ""):
	# Set background if not already set
	if back_sprite.texture == null:
		back_sprite.texture = background
	# Make dialog visible
	if back_sprite != null:
		back_sprite.visible = true
	
	# Load dialog content when empty
	if text.text == "":
		# Get translated dialog content
		var dialog_content = tr(dialog_key)
		text.text = dialog_content

		# Calculate text reveal speed
		if text.text != "":
			open_speed = opentext_speed / len(dialog_content)
		# Instantly reveal text if player skips
		if Input.is_action_just_pressed("ui_item_active"):
			text.visible_ratio = 1

	# Animate text reveal
	if text.visible_ratio != 1:
		text.visible_ratio += open_speed
		# Hide buttons during animation
		end.visible = false
		yes.visible = false
		no.visible = false
		next.visible = false
	else:
		# Show appropriate buttons after animation completes
		match npc_dia:
			1: # End dialog (only exit button)
				end.visible = true
				next.visible = false
				yes.visible = false
				no.visible = false
			2: # Continue dialog (next button)
				next.visible = true
				end.visible = false
				yes.visible = false
				no.visible = false
			3: # Choice dialog (yes/no buttons)
				yes.visible = true
				no.visible = true
				end.visible = false
				next.visible = false

# Hide dialog interface
func dialog_off():
	back_sprite.visible = false
	# Reset text for next appearance
	text.visible_ratio = 0

# === Button handlers ===

func _on_end_pressed():
	# Close dialog completely
	dialog_on = false
	dialog_moment = 0  # Reset dialog position

func _on_next_pressed():
	# Advance to next dialog segment
	dialog_moment += 1
	# Reset text for animation
	text.visible_ratio = 0

func _on_yes_pressed():
	# Positive choice path
	dialog_moment += 1
	text.visible_ratio = 0

func _on_no_pressed():
	# Negative choice path (special increment)
	dialog_moment += 0.5
	text.visible_ratio = 0
