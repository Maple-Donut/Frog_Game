--variables
--bounce
function _init()
	player={
		sp=1,
		x=56,
		y=480,  --480
		w=8,
		h=8,
		flp=false,
		dx=0,
		dy=0,
		max_dx=2,
		max_dy=5,
		acc=0.7,
		boost=2.5, --2.5,
		anim=0,
		score=0,
		running=false,
		jumping=false,
		falling=false,
		sliding=false,
		landing=false
	}
	
	gravity=0.3
	friction=0.99
	
	--timers--	
	timer=5 --hold ❎ timer
	timer2=30 -- second timer
	timer3=1 -- this code is so messy
	--timer 3 for bnc anim
	timer4=2 --bnc_timer
	tleft=90 -- time left
	jmp_l=0 -- jump level
	pressed=false --activate jump
	direction=0 -- ⬅️ and ➡️ direction
	pc=7 --timer colour
	gameover=false -- end
	--tile sp anim
	bnc_sp=40 
	bnc_start=false
	prp_sp=81
	-- stage variable --
	comp=0
	start=false
	
	--simple camera
	cam_y=0
	
	--map limit
	map_start=0
	map_end=512
	mapx_start=0
	mapx_end=128
end
