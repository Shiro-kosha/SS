extends TextureRect

#const MARKED = Color(1.2,1.2,1.2,1)
#const UNMARKED = Color(1,1,1,1)
const UNMARKED = Color(0.7,0.7,0.7, 1)
const MARKED = Color(1,1,1,1)


func _ready():
	self.set("modulate", UNMARKED)

func _on_BigIcon_mouse_entered():
	self.set("modulate", MARKED) 


func _on_BigIcon_mouse_exited():
	self.set("modulate", UNMARKED) 
