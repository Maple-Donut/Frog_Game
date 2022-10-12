--update
function _update()
	player_update()
	player_animate()
	--camera
	mapx=flr(player.x/128)*128
	camy=player.y-64+player.w/2
	mapy=flr(player.y/128)*128
	if camy<map_start then
		camy=map_start
	end
	
	if camy>map_end-128 then
		camy=map_end-128
	end
		camera(mapx,camy)
	
	tile_anim()
	if bnc_start then
		bnc_anim()
	end
	
	--gameover screen
	if gameover then
		player.x=960
		player.y=64
		camera(896,0)
		if btnp(❎) then
		 extcmd("reset")
		end
	end
	---timer countdown+timer colour
	if timer2<0 and start
	and tleft>0 then
			timer2=30
			tleft=tleft-1
			if pc<10 and tleft>30 then
				pc=10
			elseif pc<9 and tleft<31 and tleft>16 then
				pc=9
			elseif pc<8 and tleft<16 then
				pc=8
				sfx(4)
			else
				pc=7
			end	
	else
		timer2=timer2-1
	end
	--tutorial
	if player.y<45*8 
	and player.landed
	and not start then
		start=true
		sfx(2)
	end
	--end game
	if tleft<1 then
		gameover=true
	end
end


function _draw()
	cls(1)
	map(0,0)
	spr(player.sp,player.x,player.y,1,1,player.flp)
	draw_anim()
	--instruction
	print("hold ❎ to jump!",6.5*8,55*8,7)
	print("tap ⬅️ and ➡️",6*8,56*8,7)
	print("for direction!",6.5*8,57*8,7)
	--draw arrow
	if btn(❎)
	and player.landed 
	and not gameover then
		spr(jmp_l+33,player.x,player.y-8,1,1)	
	end
	--show time and score
	if not gameover then
		print("score = "..player.score.."m",mapx+42,camy+6,7)
		print("time = "..tleft,mapx+42,camy+14,pc)
		
	end
	--draw left/right arrow
	if player.landed
	and not gameover then
		if direction ~= 0 then
			if direction<0 then
				spr(direction+54,player.x-8,player.y,1,1)	
			else
				spr(54-direction,player.x+8,player.y,1,1,true)
			end
		end
	end
	
	if gameover then
		draw_win_lose()
	end
end