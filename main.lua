local butterfly;

local function getSheetButterfly()
	local sheetOptions = {
		width = 70,
		height = 65,
		numFrames = 84
	}
	
	sheet = graphics.newImageSheet("res/butterfly.png", sheetOptions);
	
	return sheet;
end;

local function getSequenceButterfly()
	--[[
	Following this, the optional time parameter defines the total duration of
	the sequence in milliseconds. This parameter can be omitted, in which case
	the animation will animate at the frame rate of the application (one frame
	for each time step).
	--]]
	local sequenceButterfly = {
		{
			name = "Normal fly",
			start = 1,
			count = 84,
			time = 7000,
			loopCount = count,
			loopDirection = "bounce" --Can be "Forward" or "Bounce".
		},
		
		{
			name = "Fast fly",
			frames = {1, 10, 20, 30, 40, 50, 60, 70, 80},
			time = 1000,
			loopCount = 0,
			loopDirection = "bounce"
		}
	}
	
	return sequenceButterfly;
end;

local function initButtrfly()
	butterfly = display.newSprite(getSheetButterfly(), getSequenceButterfly());
	butterfly.x = 0;
	butterfly.y = 10;
	butterfly:setSequence("Fast fly");
	butterfly:play();
end;

local function spriteEvent(event)
	--[[ envent phase for sprite
	began — The animation began playing.
	ended — The animation showed its final frame.
	bounce — The animation bounced from forward to backward while playing.
	loop — The animation looped from the beginning of the sequence.
	next — The animation played a subsequent frame that's not one of the above phases.
	--]]
	print(event.phase);
end;

local function main()
	initButtrfly();
	butterfly:addEventListener("sprite", spriteEvent);
end;

--Run main
main();
