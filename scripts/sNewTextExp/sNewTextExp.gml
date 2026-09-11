/*
	=====================
	     Text coding
	=====================
	
	
	Basic examples
	
	%*[%c[c_purple]]This makes a group with a purple text%'/
	%*[%f[default]%s["2"]]Only the %c[c_blue]! is blue. %*[%c[c_yellow]]If you dont use groups, markup tag only effects the next character.%'/%'/
	
	
	%% -> Literal %
	
	
	%n/ -> Next line


	=====================
    		Groups
	=====================
	
	
	%*[] -> Group start
		[
			%c[] -> Markup tag
			%f[] -> Markup tag
		]
	
	
	%'/ -> Group end
	
	
	=====================
	     Markup Tags
	=====================


	%c[] -> Color
		[
		c_blue -> Gamemaker color
		$c427d9 -> Hex code
		]
		
		
	%xo[] -> x offset
		[
		"20" -> text will be drawn 20 pixel to the right
		]
	
	
	%yo[] -> y offset
		[
		"20" -> text will be drawn 20 pixel to the down
		
	
	%s[] -> Scale
		[
		"2" -> Scale amount
		]
		
		
	%sx[] -> Scale x
		[
		"2" -> Scales only x
		]
		
		
	%sy[] -> Scale y
		[
		"2" -> Scales only y
		]
		
		
	%a[] -> Alpha
		[
		"0.5" -> Alpha level
		]
		
	
	%r[] -> Rotate letter
		[
		"45" -> Rotates the letters by 45 degrees
		]
	
	
	%rl[] -> Rotate line
		[
		"315" -> Rotates the lines by 315 degrees
		]
	
	
	%f[] -> Font
		[
		default -> Font name
		]
		
	
	%k[] -> Kerning (Empty place between letters)
		[
		"20" -> Pixel amount between letters
		]
	
	
	%j[] -> Line spacing
		[
		"20" -> Pixel amount between lines
		]
	
	
	%m[] -> Movement
		[
		sin_wave_up_down -> Movement option
		sin_wave_left_right[speed="2"] -> Movement option with options
		]
		
	
	%e[] -> Effects
		[
		trail[copy_amount="4",alpha="0.5",alpha_decrease=true,color=c_yellow,size_incrase=true,max_size="2"] -> Trail effect with options
		outline[size="5",color=c_black] -> Outline effect with options
		shadow[size="5",color=c_black] -> Shadow effect with options
		shadow_copy[copy_amount="5",angle="235"] -> Shadow copy effect with options
		]
	
	
	%l[] -> Layer (Put text/sprite behind the main text)
		[
		%*[%l["Example text"]]This is the test text%/ -> Example text will be drawn behind the main text
		%*[%l[sTextSprite,alpha="0.5"]]AAaaaAaAaAaAaaa%/ -> sTextSprite will be drawn behind the text
		]
		
		
	%d[] -> Delay
		[
		second=10 -> Wait 10 seconds
		]
		
		
	%snd[] -> Sound
		[
		voice1[pitch="0.5"] -> Plays the sound
		]
	
	
	%ani[] -> Sprite animation speed
		[
		"30" -> Change every 30 frames
		]
	
	
	%scr[] -> Scripts
		[
		sCoinGain -> Runs the script
		]


	%(markuptag)/ -> Restore the previous value of the markup tag
		Exp: %*[%c[c_green]]Hello I am a %*[%c/]computer%'/.%'/
		Exp2: %*[%c[c_red]]red red red %*[%c[c_blue]]blue blue blue %*[%c/]red red%'/ blue blue%'/ red red %*[%c/]white white%'/%'/
		
	%(markuptag)// -> Reset the markup tag to its default value
		Exp: %*[%c[c_red]]%*[%c[c_blue]]%*[%c//]white%'/%'/%'/
	
	
	=====================
	     Text Options
	=====================
	
	
	Use these optionally at the start of the string
	
	
	%xs[] -> x starting pos
		[
		"50" -> Start drawing at x=50
		]
	
	
	%ys[] -> y starting pos
		[
		"50" -> Start drawing at y=50
		]
		
		
	%ftc[] -> fix to camera
		[
		true -> Pick if you draw reletive to camera or not
		]
*/