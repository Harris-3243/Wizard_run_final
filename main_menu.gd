extends MarginContainer

const first_scene = preload("res://cutscene_begining.tscn")

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Label
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Label
onready var selector_three = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Label

var current_selection = 0

func _ready():
	set_current_selection(0)

func _process(_delta):
	if Input.is_action_just_pressed("ui_down"):
		if current_selection < 2:
			current_selection += 1
			set_current_selection(current_selection)
		else:
			current_selection -=2
			set_current_selection(current_selection)

	elif Input.is_action_just_pressed("ui_up" ):
		if current_selection > 0:
			current_selection -= 1
			set_current_selection(current_selection)
		else:
			current_selection +=2
			set_current_selection(current_selection)
			
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0:
		TransformationScreen.change_scene("res://cutscene_begining.tscn")
	elif _current_selection == 1:
		TransformationScreen.change_scene("res://controlls.tscn")
	elif _current_selection == 2:
		get_tree().quit()

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
	elif _current_selection == 2:
		selector_three.text = ">"
	