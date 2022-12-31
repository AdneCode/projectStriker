--Holy!

n = tt_none 
g = tt_plains
w = tt_ocean
s = tt_player_start_nomad_plains
gridHeight, gridWidth, gridSize = SetCustomCoarseGrid(20)
terrainLayoutResult = SetUpGrid(gridSize, n, terrainLayoutResult)
middle =  math.ceil(gridSize/2)	

for i = 0, 7 do
	spawn = 6 + 3*i
	terrainLayoutResult[19][spawn].terrainType = s
	terrainLayoutResult[19][spawn].playerIndex = i 
end



