extends CenterContainer

onready var arts = [
	preload("res://main_page/art_1.png"),
	preload("res://main_page/art_2.png"), 
	preload("res://main_page/art_3.png")
	]

onready var BigIcon = preload("res://main_page/BigIcon.tscn")

onready var art_box = $"%ArtBox"

func _ready():
	for art in arts:
		var big_icon = BigIcon.instance()
		big_icon.set("texture", art)
		art_box.add_child(big_icon)


