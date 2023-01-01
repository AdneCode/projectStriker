--Holy!

n = tt_none 
g = tt_plains
w = tt_ocean
s = tt_player_start_nomad_plains
gridHeight, gridWidth, gridSize = SetCustomCoarseGrid(20)
terrainLayoutResult = SetUpGrid(gridSize, n, terrainLayoutResult)
middle =  math.ceil(gridSize/2)	
xEdgeTop = middle-4
xEdgeBottom = middle+4
zEdgeTop = middle+12
zEdgeBottom = middle-12
xSpawn = 4

for i = 0, 7 do
	spawn = 6 + 3*i
	terrainLayoutResult[xSpawn][spawn].terrainType = s
	terrainLayoutResult[xSpawn][spawn].playerIndex = i 
end

for xPos = 1, gridSize do
	for yPos = 1, gridSize do
		terrainLayoutResult[xPos][yPos].terrainType = w
	end
end

for xPos = xEdgeTop, xEdgeBottom do
	for yPos = zEdgeBottom, zEdgeTop do
		terrainLayoutResult[xPos][yPos].terrainType = g
	end
end






