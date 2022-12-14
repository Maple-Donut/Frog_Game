--map setup

function map_setup()
	--timers
	timer=30
	anim_timer=30 --30 = 1 second

	--map tile setting
	wall=0
	key=1
	door=2
	anim1=3
	anim2=4
	lose=6
	win=7
end

function update_map()
	if (timer<0) then
		toggle_tiles()
		timer=anim_timer
	end
	timer-=1
end
		

function draw_map()
	mapx=flr(p.x/16)*16
	mapy=flr(p.y/16)*16
	camera(mapx*8,mapy*8)

	map(0,0,0,0,128,64)	
end

function is_tile(tile_type,x,y)
	tile=mget(x,y)
	has_flag=fget(tile,tile_type)
	return has_flag
end

function can_move(x,y)
	return not is_tile(wall,x,y)
end

function swap_tile(x,y)
	tile=mget(x,y)
	mset(x,y,tile+1)
end

function unswap_tile(x,y)
	tile=mget(x,y)
	mset(x,y,tile-1)
end

function get_key(x,y)
	p.keys+=1
	swap_tile(x,y)
	sfx(1)
end

function open_door(x,y)
	p.keys-=1
	swap_tile(x,y)
	sfx(2)
end

