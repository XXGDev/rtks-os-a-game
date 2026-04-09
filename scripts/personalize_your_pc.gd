extends Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for bg in $Content/list.get_children():
		bg.get_node("container/btn").pressed.connect(func():
			$"../wallpaper".texture = bg.get_node("container/btn").texture_normal
		)
