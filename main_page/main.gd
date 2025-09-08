extends Control

class_name Main

enum SECTIONS { MAIN, GALLERY, LORE, ABOUT}

onready var SCENES = {
	SECTIONS.MAIN : preload("res://main_page/ArtBox.tscn"),
#	SECTIONS.GALLERY : preload("res://main_page/ArtBox.tscn"),
#	SECTIONS.LORE : preload("res://main_page/ArtBox.tscn"),
#	SECTIONS.ABOUT : preload("res://main_page/ArtBox.tscn"),
	}
onready var spacer = $ScrollContainer/ContentBox/Spacer

onready var content_box = $"%ContentBox"
onready var tool_bar = $"%ToolBar"


func _ready():
	print( tool_bar.btns.keys())
	for btn in tool_bar.btns.keys():
		btn.connect("pressed", self, "_on_content_request", [tool_bar.btns[btn]])
	
	content_box.add_child(SCENES[SECTIONS.MAIN].instance())


func _on_content_request(content):
	clear()
	if SCENES.keys().has(content):
		content_box.add_child(SCENES[content].instance())


func clear():
	for i in content_box.get_children():
		if i != spacer:
			i.queue_free()
