(* 
droopple.scpt: 
Helps you Setup and run droopy
Droopy website: http://stackp.online.fr/droopy
*)

property appName : "Droopple"

on run
	(* settings:begin *)
	set MyAvatar to "~/bin/droopy/avatar.jpg" -- Your avatar path
	set MyDroopy to "~/bin/droopy/droopy.sh"  -- Droopy path
	(* settings:end *)
	
	(* code:begin *)
	-- Retrieve Username to display on the page
	set TheName to the text returned of (display dialog "Enter Name:" with icon note default answer "")
	
	-- Retrieve the Port to be used by the service.
	set ThePort to the text returned of (display dialog "Enter Port (defaults to 8000):" with icon note default answer "")
	
	-- Prepare droopy command.
	-- Should run the comand and return pid.
	set TheCommand to "python " & MyDroopy & " -m 'Hi! " & TheName & " here. Please send me your file.' -p " & MyAvatar & " " & ThePort & " > /dev/null 2>&1 & echo $!"
	
	set ThisPID to do shell script TheCommand

	set TheButton to display dialog "Droopy Server running!" buttons "Stop"
	
	if TheButton = "Stop" then
		do shell script "kill -9 " & ThisPID
	end if
	(* code:end *)
end run

on reopen
	run
end reopen