extends MarginContainer

var DB

onready var col_left = $"%ColLeft"
onready var col_mid = $"%ColMid"
onready var col_right = $"%ColRight"

func _ready():
	DB = load_db()
	fill()

func load_db():
	var a = File.new()
	a.open("res://data/Replica.json", File.READ)
	var db  = JSON.parse(a.get_as_text()).result
	return db

	
func fill():
	var dir = Directory.new()
	for i in DB.gallery.keys():
		var path = str("res://gallery/arts/", i, ".jpg")
		if dir.file_exists(path):
			var img = load(path)
			var img_size = img.get_size()
			var TR = TextureRect.new()
			var col = col_right
			if img_size.x > img_size.y:
				col = col_mid
			elif col_left.get_child_count() <= col_right.get_child_count():
				col = col_left
				
			TR.set("texture", img)
			TR.set("expand", true)
			var msy = (img_size.y * col.rect_size.x) / img_size.x 
			TR.rect_min_size.y = msy
			col.add_child(TR)
