extends Node

onready var _Body_AnimationPlayer = self.find_node("Body_AnimationPlayer")
onready var _Body_LBL = self.find_node("Body_Label")
onready var _Character_Texture = find_node("Character_Texture")
onready var _Dialog_Box = self.find_node("Dialog_Box")
onready var _Speaker_LBL = self.find_node("Speaker_Label")
onready var _SpaceBar_Icon = self.find_node("SpaceBar_NinePatchRect")

onready var _audio_player = get_node("/root/DialoguePlayer")
onready var _music = get_tree().get_current_scene().get_node("Music")

var _did = 0
var _nid = 0
var _final_nid = 0
var _Story_Reader
var _texture_library : Dictionary = {}

# Virtual Methods

func _ready():
	var Story_Reader_Class = load("res://addons/EXP-System-Dialog/Reference_StoryReader/EXP_StoryReader.gd")
	_Story_Reader = Story_Reader_Class.new()
	
	var story = load("res://CreditsBaked.tres")
	_Story_Reader.read(story)
	
	_load_textures()
	
	_Dialog_Box.visible = false
	_SpaceBar_Icon.visible = false
	
	play_dialog("Credits")


func _input(event):
	if event is InputEventKey:
		if event.pressed == true and event.scancode == KEY_SPACE:
			_on_Dialog_Player_pressed_spacebar()

# Callback Methods

func _on_Body_AnimationPlayer_animation_finished(anim_name):
	_SpaceBar_Icon.visible = true


func _on_Dialog_Player_pressed_spacebar():
	if _is_waiting():
		_SpaceBar_Icon.visible = false
		_Character_Texture.visible = false
		_get_next_node()
		if _is_playing():
			_play_node()

# Public Methods

func play_dialog(record_name : String):
	_did = _Story_Reader.get_did_via_record_name(record_name)
	_nid = self._Story_Reader.get_nid_via_exact_text(_did, "<start>")
	_final_nid = _Story_Reader.get_nid_via_exact_text(_did, "<end>")
	_get_next_node()
	_play_node()
	_Dialog_Box.visible = true
	
	# Audio
	if(_audio_player):
		# Set audio bank and index
		_audio_player.set_dialogue_audio("credits", _did)
	
	if(_music):
		_music.stream = load("res://Audio/music/Last of our kind.wav")
		_music.volume_db = -13
		_music.play()

# Private Methods

func _display_image(key : String):
	_Character_Texture.texture = _texture_library[key]
	_Character_Texture.visible = true

func _is_playing():
	return _Dialog_Box.visible


func _is_waiting():
	return _SpaceBar_Icon.visible


func _load_textures():
	var did = _Story_Reader.get_did_via_record_name("Credits/PictureLibrary")
	var json_text = _Story_Reader.get_text(did, 1)
	var raw_texture_library : Dictionary = parse_json(json_text)

	for key in raw_texture_library:
		var texture_path = raw_texture_library[key]
		var loaded_texture = load(texture_path)
		_texture_library[key] = loaded_texture


func _get_next_node():
	_nid = _Story_Reader.get_nid_from_slot(_did, _nid, 0)
	
	if _nid == _final_nid:
		_Dialog_Box.visible = false
		get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _get_tagged_text(tag : String, text : String):
	var start_tag = "<" + tag + ">"
	var end_tag = "</" + tag + ">"
	var start_index = text.find(start_tag) + start_tag.length()
	var end_index = text.find(end_tag)
	var substr_length = end_index - start_index
	return text.substr(start_index, substr_length)


func _play_node():
	var text = _Story_Reader.get_text(_did, _nid)
	var speaker = _get_tagged_text("speaker", text)
	var dialog = _get_tagged_text("dialog", text)
	if "<image>" in text:
		var library_key = _get_tagged_text("image", text)
		_display_image(library_key)
	
	_Speaker_LBL.text = speaker
	_Body_LBL.text = dialog
	_Body_AnimationPlayer.play("TextDisplay")
	
	# Only audio for the first robot dialogues
	if(_audio_player && _nid <= 10):
		# Play current audio track
		_audio_player.play_next_dialogue()
