extends MarginContainer
onready var btn_box = $"%BtnBox"
const MARKED = Color(1.5, 1.5, 1.5, 1)
const UNMARKED = Color(1, 1, 1, 1)

onready var btns = {
	$"%HomeBtn": Main.SECTIONS.MAIN,
	$"%LoreBtn": Main.SECTIONS.LORE,
	$"%GalleryBtn": Main.SECTIONS.GALLERY, 
	$"%AboutBtn": Main.SECTIONS.ABOUT,
}

func _ready():
	for btn in btn_box.get_children():
		btn.connect("mouse_entered", self, "_on_btn_mouse_entered", [btn])
		btn.connect("mouse_exited", self, "_on_btn_mouse_exited", [btn])


func _on_btn_mouse_entered(btn):
	btn.set("modulate", MARKED)

func _on_btn_mouse_exited(btn):
	btn.set("modulate", UNMARKED)
