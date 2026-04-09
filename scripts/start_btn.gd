extends TextureButton

@onready var Start: Panel = $"../../StartMenu"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(func():
		Start.visible = not Start.visible
	)
