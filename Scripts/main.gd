extends Node2D

var timer = 7.0 #Timer
var rand = RandomNumberGenerator.new() #Random Number Generator (RNG)
@onready var text = $CanvasLayer/Label #Pointer to "Label"
@onready var custom_tween_alpha = 0 #Alpha Value in the custom tween process
var new_line_generated = false #Did one new line just get generated?
var old_lines_array = [ #Array of all legacy lines
		"soos",
		"bananana",
		"interessant",
		"lol",
		"Was machen Sachen",
		"sympatisch",
		"Mhm, stimmt wirklich",
		"ZAZ",
		"irgend n' text",
		"achtung! Bildschirmschoner",
		"Maus bewegn' macht nix. lol",
		"SUSLORD",
		"seesboy",
		"âllo?",
		"bruhhhhhhh",
		"yes sir",
		"yes sir, ris sir",
		"Rizz Sir",
		"Bbraham",
		"Hintergrund be like",
		"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
		"Die Kuh macht Muh!",
		"Du Karrotenkopf", #0.3.1 Text ab hier
		"Auf'm Buggl",
		"Moritz ist Schuld!",
		"E",
		",Weil Baum..",
		"Quadequina",
		"Oh nein, der BRIRUS!",
		"(E)(A) - BALLS",
		"Ball Stars FTW",
		"Anzeigenhauptmeister 4.0",
		"Anzeige ist raus",
		"Man sieht, es ist Obst im Haus",
		"#x.com",
		"Version 0.4.0! sheesh",
		"Me when: Christian spielt schon wieder Ball Stars in der Pause",
		"Bababoi", #0.4.0 Text ab hier
		"M T",
		"Joe",
		"Ni \n ce Person",
		"Christian du Hustensaft",
		"Martin Sagt: ",
		"Mission Failed",
		"Schmakofatz",
		"#burgerpommes",
		"Finish him!",
		"OG Fortnite Zeiten",
		"W in den Chat",
		"Bro ich hab gerade eine Werbung mit AI Voice bekommen"
]

func _ready():
	global._ready()
	for argument in OS.get_cmdline_args():
		if argument == "--nofullscreen":
			global.do_fullscreen = false
	if !global.do_fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	global.settings.load("user://settings.cfg")
	$CanvasLayer/Label.set_modulate(global.Get_Color_from_Config(global.text_color_rgb, "text", "color", Color.WHITE))
	$CanvasLayer/ColorRect.color = global.Get_Color_from_Config(global.bg_color_rgb, "bg", "color", Color.BLACK)
	
	await get_tree().process_frame
	if global.do_clock:
		$CanvasLayer/LabelC.visible = true
		$CanvasLayer/LabelC.set("theme_override_colors/font_color", global.Get_Color_from_Config(global.text_color_rgb, "text", "color", Color.WHITE))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	#Update Clock
	if global.do_clock:
		$CanvasLayer/LabelC.text = Time.get_time_string_from_system(false)
	
	#Inc Timer
	timer = timer + delta
	
	#Label and Timer Logic
	if timer >= 6 && timer <= 7: #Tween alpha to 0
		custom_tween_alpha = custom_tween_alpha - delta
		text.set("theme_override_colors/font_color", Color(1, 1, 1, custom_tween_alpha))
	if timer >= 7 && timer <= 8: #Generate new line and tween alpha to 1
		if new_line_generated == false:
			text.text = global.lines_array[rand.randi_range(0, global.lines_array.size() - 1)]
		new_line_generated = true
		custom_tween_alpha = custom_tween_alpha + delta
		text.set("theme_override_colors/font_color", Color(1, 1, 1, custom_tween_alpha))
	if timer >= 8: #reset
		new_line_generated = false
		timer = 0
			
	#Pressing Key Stuff
	if Input.is_anything_pressed():
		if Input.is_action_just_pressed("J"):
			if global.do_fullscreen:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
			get_tree().change_scene_to_file("res://Scenes/settings.tscn")
		elif Input.is_action_pressed("J"): # if hold from transition. don't delete it.
			pass
		else:
			get_tree().quit(1)
