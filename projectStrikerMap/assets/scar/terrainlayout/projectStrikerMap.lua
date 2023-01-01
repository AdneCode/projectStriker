--Holy!

n = tt_none 
g = tt_plains
h = tt_plateau_low
w = tt_ocean
s = tt_player_start_nomad_plains
t = tt_valley
--gridHeight, gridWidth, gridSize = SetCustomCoarseGrid(20)
--terrainLayoutResult = SetUpGrid(gridSize, n, terrainLayoutResult)
middle =  math.ceil(gridSize/2)	

arenaWidth = 3
arenaLength = 10
xSpawn = 4
tryLineOffset = 8
waterOffset = 2

xEdgeTop = middle-arenaWidth
xEdgeBottom = middle+arenaWidth
zEdgeTop = middle+arenaLength
zEdgeBottom = middle-arenaLength
tryLineTeam1 = middle-tryLineOffset
tryLineTeam2 = middle+tryLineOffset

for i = 0, 7 do	
	if i < 4 then
		local spawn = 15 + 3*i
		terrainLayoutResult[middle-2][spawn].terrainType = s
		terrainLayoutResult[middle-2][spawn].playerIndex = i 
	end
	if i > 3 then
		local spawn = 12 + 3*(i-3)
		terrainLayoutResult[middle+2][spawn].terrainType = s
		terrainLayoutResult[middle+2][spawn].playerIndex = i 
	end
end

--Sets water
for xPos = 1, gridSize do
	for yPos = 1, gridSize do
		terrainLayoutResult[xPos][yPos].terrainType = w
	end
end

--Sets ground for arena
for xPos = xEdgeTop, xEdgeBottom do
	for yPos = zEdgeBottom, zEdgeTop do
		terrainLayoutResult[xPos][yPos].terrainType = g
	end
end

--Sets tryline for score area
for xPos = xEdgeTop, xEdgeBottom do
	terrainLayoutResult[xPos][tryLineTeam1].terrainType = t
	terrainLayoutResult[xPos][tryLineTeam2].terrainType = t
end

--Fills area around water
for xPos = 1, gridSize do
	for yPos = 1, gridSize do
		if terrainLayoutResult[xPos][yPos].terrainType == w then
			if xPos < xEdgeTop-waterOffset or
				yPos < zEdgeBottom-waterOffset or
				xPos > xEdgeBottom+waterOffset or
				yPos > zEdgeTop+waterOffset then
				terrainLayoutResult[xPos][yPos].terrainType = g
			end
		end
	end
end






