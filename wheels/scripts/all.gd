extends Node

var spawn_pos ="top-right"
var gameover = false
var score = 0
var color = "black"
var no_intro = false
var mainscene = false
var target = 10
var can_play = false
var congrats = false
var tutorial = 0
var speed = 100
var max_speed = 120
var rot_amount = 0
var main_rot = 0
var wheel_status = ""
var once = false
var clear = false
var delay = false
var redpad_color = "red"
var purple_color = "green"
var begin = false
var rain_speed = 0.5
var rain_amount = 8
var transform_amount = 3
var camera_shake = false
#begin the mainscene process and start spawning
# the amount of stars that shoe in the gamover
#score
#savings
var highscore = 0
var dark = 0
var sound = 0
var save_data = {"highscore" : 0, "target" : 0,"tutorial": 0}
var settings = {
	"input" : {
		"dark" : 0,
		"sound" : 1,
		}
		}

var instance_of_configuration_file = ConfigFile.new()
var instance_data_file = File.new()
var path_to_data_file = "res://save_file.json"
var path_to_configuration_file = "res://configuration_file.cfg"

#ads


var admob = null
var real_ads = false
var banner_top = false
var ad_banner_id = "ca-app-pub-3940256099942544/6300978111"
#var ad_interstitial_id = "ca-app-pub-3940256099942544/1033173712"
#var ad_rewarded_id = "ca-app-pub-3940256099942544/5224354917"
var enable_ads = true 


func _ready():
#	load_settings()
	load_score()
	
	if Engine.has_singleton("AdMob"):
		admob = Engine.get_singleton("AdMob")
		admob.init(real_ads, get_instance_id())
		admob.loadBanner(ad_banner_id, banner_top)
#		admob.loadInterstitial(ad_interstitial_id)
#		admob.loadRewardedVideo(ad_rewarded_id)
#		admob.resize()
	pass


func show_ad_banner():
	if admob and enable_ads:
		admob.showBanner()
func hide_ad_banner():
	if admob:
		admob.hideBanner()


func load_score():
	if not instance_data_file.file_exists(path_to_data_file):
		return
	instance_data_file.open(path_to_data_file,File.READ)
	save_data = parse_json(instance_data_file.get_as_text())
	highscore = save_data["highscore"]
	target = save_data["target"]
	tutorial = save_data["tutorial"]
	#in the main scene ready function the highscore label = main_text

func save_score():
	save_data["highscore"] = highscore
	save_data["target"] = target
	save_data["tutorial"] = tutorial
	instance_data_file.open(path_to_data_file,File.WRITE)
	instance_data_file.store_line(to_json(save_data))
	instance_data_file.close()


func save_settings():
	settings["input"]["dark"] = dark
	settings["input"]["sound"] = sound
	
	for section in settings.keys():
		for keys in settings[section]:
			instance_of_configuration_file.set_value(section,keys,settings[section][keys])
			instance_of_configuration_file.save(path_to_configuration_file)
			print(settings)
	pass
func load_settings():
	var err = instance_of_configuration_file.load(path_to_configuration_file)
	if not err == OK:
		return
	else:
		for section in settings.keys():
			for keys in settings[section]:
				var loaded_settings = instance_of_configuration_file.get_value(section,keys,settings[section][keys])
				settings[section][keys] = loaded_settings
				dark = settings["input"]["dark"]
				sound = settings["input"]["sound"]
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
