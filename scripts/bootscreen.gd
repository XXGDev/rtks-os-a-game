extends Panel

@onready var tweenPanel: Panel = $"../TweenPanel"

func wait(s: float):
	await get_tree().create_timer(s).timeout

func second_err_func():
	await wait(1)
	
	tweenPanel.visible = true
	# Start the panel as transparent black
	tweenPanel.modulate = Color(0, 0, 0, 0)

	# Tween 1: Fade to solid black
	var tween_in = create_tween()
	tween_in.tween_property(tweenPanel, "modulate", Color(0, 0, 0, 1), 1.0)
	await tween_in.finished

	# Switch visibility while the screen is black
	visible = false
	$"../Logon".visible = true
	$"../StartupSound".play()
	
	# Tween 2: Fade back to transparent
	var tween_out = create_tween()
	tween_out.tween_property(tweenPanel, "modulate", Color(0, 0, 0, 0), 1.0)
	await tween_out.finished

	tweenPanel.visible = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MsgBox.RTKS_OS = $"../"
	await wait(5)
	MsgBox.err(
		"error",
		"The booting operation has encountered an error. As a result, the system may become unstable!",
		"OK", "", "",
		func():
			await wait(0.5)
			MsgBox.err(
				"warning",
				"The program RTKS_OS is causing a huge memory leak and damage to your PC! Do you wish to continue?",
				"Yes",
				"No", "",
				second_err_func,
				true,
				Callable(),
				false
			),
)
