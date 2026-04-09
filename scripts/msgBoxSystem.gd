extends Node

class_name MsgBox

static var RTKS_OS: Node = null
static var error_box: PackedScene = preload("res://scenes/error_box.tscn")

static func err(
	type: String,
	msg: String,
	btn1_text: String = "OK",
	btn2_text: String = "",
	btn3_text: String = "",
	on_btn1_func: Callable = Callable(),
	clear_on_btn1: bool = true,
	on_btn2_func: Callable = Callable(),
	clear_on_btn2: bool = true,
	on_btn3_func: Callable = Callable(),
	clear_on_btn3: bool = true
	):
	if RTKS_OS == null:
		push_error("RTKS_OS not registered!")
		return
	
	print(clear_on_btn1, clear_on_btn2, clear_on_btn3)
	
	var error = error_box.instantiate()
	
	var btn1: Button = error.get_node("Content/btnList/btn1")
	var btn2: Button = error.get_node("Content/btnList/btn2")
	var btn3: Button = error.get_node("Content/btnList/btn3")
	
	btn1.pressed.connect(func():
		if clear_on_btn1 == true:
			error.queue_free()
		if on_btn1_func.is_valid():
			on_btn1_func.call()
	)
	btn2.pressed.connect(func():
		if clear_on_btn2 == true:
			print("cleared on btn2")
			error.queue_free()
		if on_btn2_func.is_valid():
			on_btn2_func.call()
	)
	btn3.pressed.connect(func():
		if clear_on_btn3 == true:
			error.queue_free()
		if on_btn3_func.is_valid():
			on_btn3_func.call()
	)
	
	btn1.text = btn1_text
	btn1.visible = true
	
	if btn2_text != "":
		btn2.text = btn2_text
		btn2.visible = true
	
	if btn3_text != "":
		btn3.text = btn3_text
		btn3.visible = true
	
	if type == "error":
		error.get_node("Content/msg").text = "❌ " + msg
		error.get_node("Topbar/title").text = "Error"
		RTKS_OS.get_node("ErrorSound").play()
	elif type == "warning":
		error.get_node("Content/msg").text = "⚠️ " + msg
		error.get_node("Topbar/title").text = "Warning"
		RTKS_OS.get_node("WarningSound").play()
	
	RTKS_OS.add_child.call_deferred(error)
