function sBasicTimer(timer_name, frames_to_count, active_frames = 1, looping = true){
	/// @function							sBasicTimer(timer_name,frames_to_count,*active_frames) = bool
	/// @param {string} timer_name			Name of the timer
	/// @param {number} frames_to_count		Number of frames before returning true
	/// @param {number} *active_frames		Number of frames that it stays true
	/// @param {bool} *looping				If opened timer eill be loop and will be reusable (optional)
	/// @desc								This function counts the given frames before returning true. If active_frames are given it returnes true for that number of frames and loops.
	
	
	if (!variable_instance_exists(id,"BasicTimer")){
		BasicTimer = {};
	}
	
	
	//If timer doesnt exist create one
	if (!struct_exists(BasicTimer, timer_name)){
		BasicTimer[$timer_name] = {
			counter : 0,
			frames_to_count : frames_to_count,
			active_frames : active_frames,
			looping : looping
		};
	}
	
	var timer = BasicTimer[$timer_name];
	
	timer.counter++;
	if (timer.counter >= timer.frames_to_count){
		if(timer.counter < timer.frames_to_count + timer.active_frames){
			return true;
		}else{
			if (timer.looping){
				timer.counter = 0
			}else{
				timer.counter--;
			}
			return false;
		}
	}
	return false;
}