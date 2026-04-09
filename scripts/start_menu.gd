extends Panel

@onready var desktop: Panel = $"../"
@onready var appsList: VBoxContainer = $Apps/List

func open_app(app_name: String, disable_icons: bool = true):
	visible = false
	
	var app_to_open = desktop.get_node(app_name)
	
	# 1. Prepare the starting state
	app_to_open.pivot_offset = app_to_open.size / 2
	app_to_open.scale = Vector2(0.8, 0.8)  # Start slightly smaller
	app_to_open.modulate.a = 0.0          # Start invisible
	app_to_open.visible = true            # Make it active so the tween is visible
	
	# 2. Create the "Pop-in" animation
	var tween = create_tween().set_parallel(true)
	
	# Scale up to normal size (1.0) with a "Back" transition for the bounce
	tween.tween_property(app_to_open, "scale", Vector2.ONE, 0.25)\
		.set_trans(Tween.TRANS_BACK)\
		.set_ease(Tween.EASE_OUT)
	
	# Fade in to full opacity
	tween.tween_property(app_to_open, "modulate:a", 1.0, 0.15)

	desktop.get_node("icons").visible = not disable_icons

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TODO: when every app's panel is finally added (in relation to the start menu) then uncomment this
	#for item in appsList.get_children():
	#	item.pressed.connect(open_app(item.name.left(-3)))
	
	appsList.get_node("WelcomeCenterBtn").pressed.connect(func():
		open_app("WelcomeCenter", false)
	)
	appsList.get_node("RTKSBrowserBtn").pressed.connect(func():
		open_app("RTKSBrowser")
	)
	appsList.get_node("RTKSMusicBtn").pressed.connect(func():
		open_app("RTKSMusic", false)
	)
	appsList.get_node("PersonalizeYourPCBtn").pressed.connect(func():
		open_app("PersonalizeYourPC", false)
	)
	appsList.get_node("NotepadBtn").pressed.connect(func():
		open_app("Notepad", false)
	)
	appsList.get_node("FileExplorerBtn").pressed.connect(func():
		open_app("FileExplorer", false)
	)
