extends Panel

var dragging = false
var drag_offset = Vector2.ZERO

func enable_dragging(node, event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Start dragging and remember where we clicked relative to the panel
				dragging = true
				drag_offset = get_global_mouse_position() - node.global_position
			else:
				# Stop dragging when the mouse is released
				dragging = false

	if event is InputEventMouseMotion and dragging:
		var screen_size = get_viewport_rect().size
		node.global_position.x = clamp(node.global_position.x, 0, screen_size.x - node.size.x)
		node.global_position.y = clamp(node.global_position.y, 0, screen_size.y - node.size.y)
		# Move the panel to follow the mouse, maintaining the offset
		node.global_position = get_global_mouse_position() - drag_offset

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$WelcomeCenter/Topbar.gui_input.connect(func(event):
		enable_dragging($WelcomeCenter, event)
	)
	$RTKSMusic/Topbar.gui_input.connect(func(event):
		enable_dragging($RTKSMusic, event)
	)
	$PersonalizeYourPC/Topbar.gui_input.connect(func(event):
		enable_dragging($PersonalizeYourPC, event)
	)
	$Notepad/Topbar.gui_input.connect(func(event):
		enable_dragging($Notepad, event)
	)
	$FileExplorer/Topbar.gui_input.connect(func(event):
		enable_dragging($FileExplorer, event)
	)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
