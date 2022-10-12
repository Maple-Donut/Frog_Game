--adventure test
--by matthew calerbank

function _init()
	map_setup()
	make_player()
	
	game_win=false
	game_over=false
end

function _update()
	if (not game_over) then
		update_map()
		move_player()
		check_win_lose()
	else
		if (btnp(❎)) extcmd("reset")
	end
end

function _draw()
	cls()
	if (not game_over) then
		draw_map()
		draw_player()
		if (btn(❎)) show_inventory()
	else
		draw_win_lose()
	end
end
