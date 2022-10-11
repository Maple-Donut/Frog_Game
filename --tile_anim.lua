--tile anim

function tile_anim()
	if prp_sp<88 and timer3<1 then
		prp_sp+=1
		timer3=1
	elseif prp_sp>87 then
		prp_sp=81
	else
		timer3-=1	
	end
end

function draw_anim()
	spr(prp_sp,3*8,55*8,1,1)
	spr(prp_sp,14*8,47*8,1,1)
	spr(prp_sp,0*8,41*8,1,1)
	spr(prp_sp,3*8,41*8,1,1)
	spr(prp_sp,6*8,38*8,1,1)
	spr(prp_sp,5*8,38*8,1,1)
	spr(prp_sp,11*8,29*8,1,1)
	spr(prp_sp,1*8,25*8,1,1)
	spr(prp_sp,11*8,16*8,1,1)
	spr(prp_sp,5*8,15*8,1,1)
	spr(prp_sp,3*8,4*8,1,1)
	spr(prp_sp,25*8,54*8,1,1)
	spr(prp_sp,20*8,46*8,1,1)
	spr(prp_sp,23*8,46*8,1,1)
	spr(prp_sp,27*8,33*8,1,1)
	spr(prp_sp,28*8,33*8,1,1)
	spr(prp_sp,19*8,25*8,1,1)
	spr(bnc_sp,29*8,8*8,1,1)
end

function bnc_anim()
	if bnc_sp<44 and timer4<1 then
		bnc_sp+=1
		timer4=2
	elseif bnc_sp>43 then
		bnc_start=false
		bnc_sp=40
	else
		timer4-=1
	end
end

