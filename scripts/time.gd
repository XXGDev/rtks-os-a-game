extends Label

func _process(_delta: float):
	# 1. Get current UTC time in seconds
	var unix_time = Time.get_unix_time_from_system()
	
	# 2. Add 3 hours (3 hours * 60 minutes * 60 seconds)
	var offset_seconds = 3 * 3600
	var target_time = unix_time + offset_seconds
	
	# 3. Convert that specific timestamp into a dictionary
	var time_dict = Time.get_time_dict_from_unix_time(target_time)
	
	# 4. Format the string safely
	text = "%02d:%02d" % [time_dict.hour, time_dict.minute]
