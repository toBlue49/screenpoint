extends Node2D

@onready var FD = $FileDialog_Open
@onready var FL_overlay = $CanvasLayer/file_loaded
@onready var FLO_Label = $CanvasLayer/file_loaded/TextEdit

func _ready():
	print("ready")
	global.settings.load("user://config.cfg")
	$CanvasLayer/GeneralSettings/Text/ColorPicker.color = global.Get_Color_from_Config(global.text_color_rgb, "text", "color", Color.WHITE)
	$CanvasLayer/GeneralSettings/BG/ColorPicker.color = global.Get_Color_from_Config(global.bg_color_rgb, "bg", "color", Color.BLACK)
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
	var array = Array((open_file.get_file_as_string(path)).split("\n"))
	var linebreak_count = 0
	
	#Filter Array
	FLO_Label.clear()
	for i in array.size():
		if i >= array.size():
			break
		if str(array[i]).is_empty() or str(array[i]).contains("###"):
			array.remove_at(i)
		else:
			i -= 1 
			array[i] = str(array[i]).replace("/n", "\n")
	if str(array[array.size() - 1]).is_empty() or str(array[array.size() - 1]).contains("###"):
			array.remove_at(array.size() - 1)
	
	#Save Filtered Array
	global.settings.set_value("text", "array", array)
	global.settings.save("user://config.cfg")
	print(array)
	
	
	#Add all lines of Array to TextEdit
	for i in array.size():
		FLO_Label.insert_line_at((i + linebreak_count), array[i])
		if str(array[i]).contains("\n"):
			linebreak_count += 1
		if str(array[i]).contains("\n") and str(array[i]).contains("###"):
			linebreak_count -= 1
		
	#Remove empty lines
	for i in FLO_Label.get_line_count():
		if FLO_Label.get_line(i) == "":
			FLO_Label.remove_line_at(i)
	
	
	#open file_loaded overlay
	FL_overlay.visible = true


func _on_ok_pressed() -> void:
	FL_overlay.visible = false
	
