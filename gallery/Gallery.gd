extends MarginContainer

var DB

onready var col_left = $"%ColLeft"
onready var col_mid = $"%ColMid"
onready var col_right = $"%ColRight"

const T_DIR = "res://gallery/arts/"
var TEXTURE = {}


func _ready():
	DB = load_db()
	fill()

func load_db():
	var a = File.new()
	a.open("res://data/Replica.json", File.READ)
	var db  = JSON.parse(a.get_as_text()).result
	return db

#func load_png(path):
#	path += ".import"
#	var dir = Directory.new()
#	if dir.file_exists(path):
#		var f = File.new()
#		if f.open(path, File.READ) == OK:
#			var a 
#			while true:
#				a = f.get_line()
#				if a.begins_with("path"):
#					break
#			for i in ["path=\"", "\""]:
#				a.erase(a.find(i), len(i))
#			if dir.file_exists(a):
#				return ResourceLoader.load(a)
#
#func load_texture(theme):
#	TEXTURE.clear()
#	var dir = Directory.new()
#	if dir.open(str(T_DIR, theme)) == OK:
#		dir.list_dir_begin()
#		var file_name = dir.get_next()
#		while file_name != "":
#			if file_name.get_extension() == "import":
#				var f = File.new()
#				if f.open(str(T_DIR,theme,"/",file_name), File.READ) == OK:
#					var a 
#					while true:
#						a = f.get_line()
#						if a.begins_with("path"):
#							break
#					for i in ["path=\"", "\""]:
#						a.erase(a.find(i), len(i))
#					var res_id = a.get_slice(".", 1)
#					res_id = res_id.get_slice("/", 1)
#					res_id = get_object_name(res_id, theme)
#					if dir.file_exists(a):
#						TEXTURE[res_id] = ResourceLoader.load(a)
#					else:
#						push_error(str("ОТСУТСТВУЮТ ФАЙЛЫ: ", res_id, " ", str(T_DIR,theme,"/",file_name)))
#			file_name = dir.get_next()
#
#func get_object_name(file_name, theme):
#	theme = str("_", theme)
#	if file_name.find(theme) > 0:
#		file_name.erase(file_name.find(theme),len(theme))
#	file_name = file_name.get_basename()
#	return file_name

func iload(path):
	var f = File.new()
	if f.open(str(path, ".import"), File.READ) == OK:
		var a 
		while true:
			a = f.get_line()
			if a.begins_with("path"):
				break
		for i in ["path=\"", "\""]:
			a.erase(a.find(i), len(i))
		return ResourceLoader.load(a)



func fill():
	var dir = Directory.new()
	for i in DB.gallery.keys():
		var path = str("res://gallery/arts/", i, ".jpg")
		if dir.file_exists(path):
			var img = iload(path)
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
		yield(get_tree().create_timer(0.1), "timeout")
