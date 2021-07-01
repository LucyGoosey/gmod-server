-- For some reason "beetraitordamage" gets ignored if I set it in
-- "server_1/garrysmod/cfg/ttt-bees.cfg", so I set it here instead, and
-- have commented it out in the cfg file.

if 'terrortown' == GAMEMODE_NAME then
	tDamage = GetConVar( 'beetraitordamage' )
	if tDamage then
	    tDamage:SetInt( 15 )
	else
	    CreateConVar( 'beetraitordamage', 15 )
	end
end
