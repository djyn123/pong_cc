pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
padx = 53
pady = 122
padw = 24
padh = 4

padiax = 53
padiay = 0
padiaw = 24
padiah = 4

ballx = 64
bally = 64
ballsize = 3
ballxdir = 5
ballydir = 3

score = 0
lives = 3
livesia = 3
colour = 15

function movepaddle()
 if btn(0) and padx >=3 then
   padx -= 3
 elseif btn(1) and padx+padw < 125 then
 		padx += 3
 end
end

function moveia()
	 padiax += ballxdir*(1/2)	
end	

function _update()
	 if lives > 0 and livesia >0 then
  	movepaddle()
  	moveball()
  	moveia()
  	bounceball()
  	bouncepaddle()
			loseball()
		end
end

function moveball()
		ballx += ballxdir
		bally += ballydir
end

function bounceball()
  if ballx < ballsize then
    ballxdir = -ballxdir
   -- sfx(0)
  end
  
  if ballx > 128 - ballsize then
    ballxdir = -ballxdir
   -- sfx(0)
  end

end

function bouncepaddle()
 	if ballx >= padx and ballx <= padx+padw and bally > pady then
	  --sfx(0)
	  ballydir = -ballydir
	  score+=10
	  colour = rnd(128)
	 end
	 if ballx >= padiax and ballx <= padiax+padiaw and bally > padiah+pady then
		--sfx(0)
		 ballydir =-ballydir
	end
end


function loseball()
		if bally > 128 then
				if lives > 0 then
				  --sfx(3)
				  bally = 24
				  lives -= 1
			 end
				else if lives == 0 then
				  ballydir = 0
				  ballxdir = 0
				  bally = 64
				 --sfx(5)
				end 
		end
		if bally < 0 then
				if livesia > 0 then
					bally = 120
					livesia -= 1
				end
				else if lives == 0 then
				  ballydir = 0
				  ballxdir = 0
				  bally = 64
				 --sfx(5)
				end					
		end		
end



function _draw()
		rectfill(0,0,128,128,20)
		print(score, 12,6,20)
		for i = 1, lives do
				spr(001,100,4)
		end
		for i = 1, livesia do
				spr(001,26,4)
		end
		print(lives, 110,6,15)
		print(livesia,20,6,15)
	 rectfill(padx,pady,padx+padw,pady+padh,50)
		rectfill(padiax,padiay,padiax+padiaw,padiay+padiah,120)
		circfill(ballx, bally, ballsize, 15)
		if lives == 0 then
						local t = "try again(wiisport ref)"
				  print(t,23,64,45)
		elseif livesia == 0 then
						print("ia looses (not a surprise)",24,64,45)
		end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888008880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700088888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000008888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0002000030350303502f3502c35034350343500315005150051500415003150021500115001150291501f3502b1502c1502d1502f150321503315034150283502835026350253502535025350253502535025350
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00100000355502f5502d5502a5502955028550245501b55019550185502a6502a6502a6502a65029650296502a6502b650135502c6502c6502d6502e6502e6502f65019550195503065031650316501c55020550
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001e150181502745027450274502745028470284702845029450284501f1501d1501d1501f15022750315501e7501d7501c7500e3500e3500d35034350273501b7502e5501c750111501e7501215020750
