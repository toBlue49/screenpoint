extends Node
var settings = ConfigFile.new()
var text_color_rgb = Color(1.0, 1.0, 1.0, 1.0)
var bg_color_rgb = Color(0.0, 0.0, 0.0, 1.0)
var lines_array :Array = [ #Array of all possible Lines
	"something went wrong. lines_array not loaded from config."
]
var color_temp = [
	0.0, 0.0, 0.0, 1.0
]
var do_fullscreen = true
var do_clock = false

func _ready() -> void:
	print_rich("Credits: [b]Bahnschrift[/b] from Microsoft.")
	settings.load("user://config.cfg")
	lines_array = global.settings.get_value("text", "array", ["Drücke J für Einstellungen"])
	do_clock = global.settings.get_value("text", "clock", false)

func Save_Color_as_Array(color, section, key):
	color_temp[0] = color.r
	color_temp[1] = color.g
	color_temp[2] = color.b
	color_temp[3] = 1.0
	global.settings.set_value(section, key, color_temp)
	print_rich("[b]Saved Color: [/b]", color_temp, "[b] at Section: [/b]", section)
	global.settings.save("user://config.cfg")
	color_temp[0] = 0.0
	color_temp[1] = 0.0
	color_temp[2] = 0.0
	color_temp[3] = 1.0

func Get_Color_from_Config(color, section, key, default_color):
	global.settings.load("user://config.cfg")
	color_temp = global.settings.get_value(section, key, default_color)
	color.r = color_temp[0]
	color.g = color_temp[1]
	color.b = color_temp[2]
	color.a = color_temp[3]
	global.text_color_rgb = color
	return color
