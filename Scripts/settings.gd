extends Node2D

@onready var FD = $FileDialog_Open
@onready var FL_overlay = $CanvasLayer/file_loaded
@onready var FLO_Label = $CanvasLayer/file_loaded/TextEdit

func _ready():
	print("ready")
	global.settings.load("user://config.cfg")
	$CanvasLayer/GeneralSettings/Text/ColorPicker.color = global.Get_Color_from_Config(global.text_color_rgb, "text", "color", Color.WHITE)
	$CanvasLayer/GeneralSettings/BG/ColorPicker.color = global.Get_Color_from_Config(global.bg_color_rgb, "bg", "color", Color.BLACK)
	update_clockbutton_text()

func _process(delta):
	
	if Input.is_action_just_pressed("J"): 
		global.settings.save("user://config.cfg")
		if global.do_fullscreen: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		get_tree().change_scene_to_file("res://Scenes/main.tscn")

#"default_font_size"

func on_text_color_changed(color):
	global.Save_Color_as_Array(color, "text", "color")
	#print("sees", global.config.get_value("text", "color"))


func on_bg_color_changed(color: Color) -> void:
	global.Save_Color_as_Array(color, "bg", "color")


func _on_file_button_pressed() -> void:
	FD.visible = true

func _on_file_selected(path: String) -> void:
	var open_file = FileAccess.open(path, FileAccess.READ)
	var array = open_file.get_file_as_string(path)
	array = str_to_var(str(array))
	
	#Save Array
	global.settings.set_value("text", "array", array)
	global.settings.save("user://config.cfg")
	print(array)
	
	#Print Array to FLO_label
	FLO_Label.text = str(array)
	
	#open file_loaded overlay
	FL_overlay.visible = true


func _on_ok_pressed() -> void:
	FL_overlay.visible = false

func update_clockbutton_text():
	if global.do_clock:
		$CanvasLayer/GeneralSettings/Clock/Button.text = "An"
	else:
		$CanvasLayer/GeneralSettings/Clock/Button.text = "Aus"

func _on_clockbutton_pressed() -> void:
	if global.do_clock:
		global.do_clock = false
	else:
		global.do_clock = true
	update_clockbutton_text()
	global.settings.set_value("text", "clock", global.do_clock)
