extends Panel

var listOfThingsToSay = [
	"Hi. I am realTheKINGS AI.", "Hai.", "Hi.", "Goodbye.", "Bye.", "My name is realTheKINGS AI.",  "1+1 is 2.",  "Duck off.", "Uhh.", "Umm...",
	"I'm too intelligent to give you an answer.", "Yes.", "How dare you.", "Ok.", "Sure.", "No.", "Duck you too.", "Hello. My name is realTheKINGS AI.",
	"Hai. I am realTheKINGS AI.", "I'm not sure how to answer that."
]

func wait(s: float = 0.5):
	await get_tree().create_timer(s).timeout

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ThinkBtn.pressed.connect(func():
		$Prompt.text = ""
		$Response.text = "..."
		await wait(randf_range(0.15, 0.6))
		$Response.text = listOfThingsToSay.pick_random()
	)
