extends Button

func close_window(panel: Panel):
	# 1. Set the pivot to the center so it shrinks inward, not toward the corner
	panel.pivot_offset = panel.size / 2

	# 2. Create a parallel tween
	var tween = create_tween().set_parallel(true)

	# Shrink to 80% size
	tween.tween_property(panel, "scale", Vector2(0.8, 0.8), 0.2).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	
	# Fade alpha to 0
	tween.tween_property(panel, "modulate:a", 0.0, 0.2)
	
	# 3. Clean up after the animation
	await tween.finished
	panel.visible = false

	# Reset scale for the next time it opens
	panel.scale = Vector2.ONE 
	panel.modulate.a = 1.0


func _ready() -> void:
	pressed.connect(func():
		close_window($"../../")
		$"../../../icons".visible = true
	)
