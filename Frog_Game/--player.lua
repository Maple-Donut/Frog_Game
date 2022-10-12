--player

function player_update()
	--physics
	player.dy+=gravity
	player.dx*=friction
	--player move ⬅️ ➡️
	if player.landed
	and not gameover then
		if btnp(⬅️) then
			if direction<1 then
				player.flp=true
			end
			if direction>-5 then
				direction-=1
			end
		end
		if btnp(➡️) then
			if direction>-1  then
				player.flp=false
			end
				if direction<5 then
					direction+=1
				end
		end
	end

	--jump
	if btn(❎) 
	and player.landed
	and not gameover then
		if timer<0 then
			timer=5
			if  jmp_l~=6 then
				jmp_l+=1
			elseif jmp_l>5 then
				jmp_l=5
			end
		else
		--charge
			timer=timer-1
			pressed=true
		end
	end
	
	--check landed
	if player.landed
	and not gameover then
		friction=0.55
		player.score=flr(-player.y+488)
		if comp>0 then
			player.score+=480*comp
		end
	else
		friction=0.99
	end
	
	--jump release	
	if not btn(❎)
	and player.landed
	and pressed then
		if jmp_l>5 then
			jmp_l=5.2
		end
		player.dx+=direction
		player.dy-=player.boost+jmp_l
		player.landed=false
		timer=5
		jmp_l=0
		pressed=false
		direction=0
			sfx(3)
	end
	
	--check collision up and down
	if player.dy>0 then
		player.falling=true
		player.landed=false
		player.jumping=false
		
		player.dy=limit_speed(player.dy,player.max_dy)
		
		--todo check platform
		
		if collide_map(player,"down",0) then
			player.landed=true
			player.falling=false
			player.dy=0
			player.y-=((player.y+player.h+2)%8)-2
		end
		--new area
		if collide_map(player,"down",5) then
			comp+=1
			tleft+=60
			player.y=480
			if comp>0 and comp<2 then
				player.x=23*8
			elseif comp>1 and comp<3 then
				player.x=39*8
			end
			sfx(0)
		end
		--bounce pad
		if collide_map(player,"up",3) then
		 player.dy+=3
		 bnc_start=true
		 sfx(5)
		elseif collide_map(player,"left",3) then
			player.dx+=3
			bnc_start=true
			sfx(5)
		elseif collide_map(player,"right",3) then
			player.dx-=3
			bnc_start=true
			sfx(5)
		elseif collide_map(player,"down",3) then
			player.dy-=6
			bnc_start=true
			sfx(5)
		end
		
	elseif player.dy<0 then
		player.jumping=true
		if collide_map(player,"up",1) then
			player.dy=0
		end
	end
	
	--check collsion left and right
	
	if player.dx<0 then
	
	--player.dx=limit_speed(player.dx,player.max_dx)		
	
		if collide_map(player,"left",1) then
			player.dx=0
		end
	elseif player.dx>0 then
	
	--player.dx=limit_speed(player.dx,player.max_dx)
	
		if collide_map(player,"right",1) then
			player.dx=0
		end
	end	
	
	player.x+=player.dx
	player.y+=player.dy
	
	if player.x<mapx_start
	and comp<1 then
		player.x=mapx_start
		player.dx=-player.dx
		if player.flp then
			player.flp = false
		end
	elseif player.x<mapx_start+(128*comp)+1
	and comp>0 then
		player.x=mapx_start+(128*comp)+1
		player.dx=-player.dx
		if player.flp then
			player.flp=false
		end
	end
	if not gameover then
		if player.x>mapx_end-player.w
		and comp<1 then
			player.x=mapx_end-player.w
			player.dx=-player.dx
			if not player.flp then
				player.flp = true
			end
		elseif player.x>mapx_end+(128*comp)-player.w
		and comp>0 then
			player.x=mapx_end+(128*comp)-player.w
			player.dx=-player.dx
			if not player.flp then
				player.flp=true
			end
		end
	end
end

function player_animate()
	if player.landed
	and jmp_l>0 
	and jmp_l<3	then
		player.sp=1

	elseif player.landed
	and jmp_l>2
	and jmp_l<5 then
		player.sp=2

	elseif player.landed
	and jmp_l>4 then
		player.sp=3

	elseif player.jumping then
		player.sp=4
	elseif player.falling then
		player.sp=6
	elseif player.sliding then
		player.sp=9
	else --player idle
		if time()-player.anim>.4 then
			player.anim=time()
			player.sp+=1
			if player.sp>2 then
				player.sp=1
			end
		end
	end
end

function limit_speed(num,maximum)
	return mid(-maximum,num,maximum)
end