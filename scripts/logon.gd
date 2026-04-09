extends Panel

@onready var wallpaperBtn = $wallpaper

@onready var user: Panel = $user
@onready var user2: Panel = $user2
@onready var punishment: Panel = $punishment

@onready var tweenPanel: Panel = $"../TweenPanel"

var userLoggedIn = false
var username = ""

# DONT FORGET TO USE AWAIT ON THE WAIT FUNCTION
func wait(s: float = 0.5):
	await get_tree().create_timer(s).timeout

func switch_panels(old_panel: Panel, new_panel: Panel, duration: float = 0.5):
	# 1. Prepare the new panel
	new_panel.modulate.a = 0.0  # Start fully transparent
	new_panel.visible = true     # Must be visible to see the fade

	# 2. Create the Fade-In Tween
	var tween = create_tween()

	# We only need to animate the 'a' (alpha) property of modulate
	tween.tween_property(new_panel, "modulate:a", 1.0, duration)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_OUT)

	# 3. Wait for the fade to finish before hiding the old one
	await tween.finished

	# 4. Cleanup
	old_panel.visible = false

func login():
	await wait(3)

	#visible = false
	#$"../Desktop".visible = true
	switch_panels(self, $"../Desktop", 1)
	
	$"../LogonSound".play(0.74)
	
	await wait(2)
	
	MsgBox.err("error", "Tutorials Guy was unable to show you around, because hes currently too lazy.")

var BadWordsList = [
	"fuck", "shit", "bitch", "ass", "nigg"
]

var pWordsList = [ # words related to the male or female reproductive system are condsidered p words here
	"penis", "cock", "dick", "vagina", "pussy", "cum", "clit", "testicle"
]

func _ready():
	wallpaperBtn.pressed.connect(_on_button_pressed)
	user.get_node("OK").pressed.connect(func():
		username = user.get_node("Username").text
		print("yeah 1")
		for word in BadWordsList:
			if word in username.to_lower():
				print("bad word detected")
				user.visible = false
				punishment.visible = true
				punishment.get_node("badWordDetected").visible = true
				print("doing it a")
				await wait(15)
				print("finish a")
				punishment.get_node("badWordDetected").visible = false
				punishment.visible = false
				user.visible = true
				return
		
		for word in pWordsList:
			if word in username.to_lower():
				print("p word detected")
				user.visible = false
				punishment.visible = true
				punishment.get_node("pWordDetected").visible = true
				print("doing it b")
				await wait(30)
				print("finish b")
				punishment.get_node("pWordDetected").visible = false
				punishment.visible = false
				user.visible = true
				return
		print("yeah 2")
		user2.get_node("UserLabel").text = username
		user.visible = false
		user2.visible = true
		login()
	)

func _on_button_pressed():
	var tween = get_tree().create_tween()
	tween.tween_property(wallpaperBtn, "position", Vector2(0, -648), 0.5).set_trans(Tween.TRANS_QUAD)
	
	if userLoggedIn:
		user2.visible = true
		login()
	else:
		user.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	pass
