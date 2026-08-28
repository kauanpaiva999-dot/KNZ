-- KN • TDME MARCONE | Painel personalizado

local data = {}
local hpData = {}

-- Compatibilidade: alguns ambientes não expõem Drawing/setclipboard.
local HAS_DRAWING = type(Drawing) == "table" and type(Drawing.new) == "function"
local function copyDiscord()
	pcall(function()
		if type(setclipboard) == "function" then
			copyDiscord()
		end
	end)
end
copyDiscord()

local RunService = game:GetService("RunService")

game:GetService("Workspace")
hpData.value1 = workspace.CurrentCamera
hpData.value2 = game:GetService("Players")
hpData.value3 = game:GetService("ReplicatedStorage")
hpData.value4 = hpData.value2.LocalPlayer
hpData.value5 = {
	Box = false,
	BoxV2 = false,
	HP = false,
	Nome = false,
	Dist = false,
	Rank = false,
	Tool = false,
	ToolV2 = false,
	Tracer = false,
	Skeleton = false,
	Highlight = false,
	TeamCheck = false,
	RGB = false,
	HPPosicao = "Lado",
	TracerOrigem = "Chao",
	TracerAlvo = "Tronco",
	Ignored = {},
}
function hpData.value6(secondaryPlayer)
	if hpData.value5.RGB then
		return Color3.fromHSV(tick() * 0.15 % 1, 1, 1)
	end

	if secondaryPlayer and secondaryPlayer.Team then
		local TeamColorColor = secondaryPlayer.Team.TeamColor.Color

		if TeamColorColor.R + TeamColorColor.G + TeamColorColor.B < 0.05 then
			return Color3.fromRGB(255, 60, 60)
		end

		return TeamColorColor
	end

	return Color3.fromRGB(255, 60, 60)
end
function hpData.value7(instance)
	return table.find(hpData.value5.Ignored, instance.Name) ~= nil
end
function hpData.value8(secondaryPlayer)
	if not secondaryPlayer or secondaryPlayer == hpData.value4 then
		return false
	end

	if hpData.value7(secondaryPlayer) then
		return false
	end

	if not hpData.value5.TeamCheck then
		return true
	end

	local Team = secondaryPlayer.Team

	if Team then
		Team = hpData.value4.Team
	end

	if Team then
		return secondaryPlayer.Team ~= hpData.value4.Team
	end

	return true
end
function hpData.value9(argument, data)
	if not HAS_DRAWING then
		return nil
	end

	local drawing = Drawing.new(argument)

	for k, secondaryK in pairs(data) do
		drawing[k] = secondaryK
	end

	return drawing
end
function hpData.value10(toArgument, from, to, color)
	toArgument.From = from
	toArgument.To = to
	toArgument.Color = color
	toArgument.Visible = true
end
hpData.value11 = {
	{
		"Head",
		"Torso",
	},
	{
		"Torso",
		"Left Arm",
	},
	{
		"Torso",
		"Right Arm",
	},
	{
		"Torso",
		"Left Leg",
	},
	{
		"Torso",
		"Right Leg",
	},
}
hpData.value12 = {
	{
		"Head",
		"UpperTorso",
	},
	{
		"UpperTorso",
		"LowerTorso",
	},
	{
		"UpperTorso",
		"LeftUpperArm",
	},
	{
		"LeftUpperArm",
		"LeftLowerArm",
	},
	{
		"LeftLowerArm",
		"LeftHand",
	},
	{
		"UpperTorso",
		"RightUpperArm",
	},
	{
		"RightUpperArm",
		"RightLowerArm",
	},
	{
		"RightLowerArm",
		"RightHand",
	},
	{
		"LowerTorso",
		"LeftUpperLeg",
	},
	{
		"LeftUpperLeg",
		"LeftLowerLeg",
	},
	{
		"LeftLowerLeg",
		"LeftFoot",
	},
	{
		"LowerTorso",
		"RightUpperLeg",
	},
	{
		"RightUpperLeg",
		"RightLowerLeg",
	},
	{
		"RightLowerLeg",
		"RightFoot",
	},
}
hpData.value13 = nil
hpData.value13 = {}
function hpData.value14(argument)
	if not HAS_DRAWING then
		return
	end

	if argument == hpData.value4 or hpData.value13[argument] then
		return
	end

	local data = hpData.value13
	local boxTop = hpData.value9("Line", {
		Thickness = 1.5,
		Visible = false,
		Transparency = 0.97,
	})
	local boxBot = hpData.value9("Line", {
		Thickness = 1.5,
		Visible = false,
		Transparency = 0.97,
	})
	local boxLeft = hpData.value9("Line", {
		Thickness = 1.5,
		Visible = false,
		Transparency = 0.97,
	})
	local boxRight = hpData.value9("Line", {
		Thickness = 1.5,
		Visible = false,
		Transparency = 0.97,
	})
	local tlh = hpData.value9("Line", {
		Thickness = 2.5,
		Visible = false,
		Transparency = 0.97,
	})
	local tlv = hpData.value9("Line", {
		Thickness = 2.5,
		Visible = false,
		Transparency = 0.97,
	})
	local trh = hpData.value9("Line", {
		Thickness = 2.5,
		Visible = false,
		Transparency = 0.97,
	})
	local trv = hpData.value9("Line", {
		Thickness = 2.5,
		Visible = false,
		Transparency = 0.97,
	})
	local blh = hpData.value9("Line", {
		Thickness = 2.5,
		Visible = false,
		Transparency = 0.97,
	})
	local blv = hpData.value9("Line", {
		Thickness = 2.5,
		Visible = false,
		Transparency = 0.97,
	})
	local brh = hpData.value9("Line", {
		Thickness = 2.5,
		Visible = false,
		Transparency = 0.97,
	})
	local brv = hpData.value9("Line", {
		Thickness = 2.5,
		Visible = false,
		Transparency = 0.97,
	})
	local hpbgCallback = hpData.value9
	local color = Color3.new(0, 0, 0)
	local hpbg = hpbgCallback("Line", {
		Thickness = 3,
		Visible = false,
		Color = color,
		Transparency = 1,
	})
	local hpCallback = hpData.value9
	local secondaryColor = Color3.fromRGB(0, 255, 0)
	local hp = hpCallback("Line", {
		Thickness = 1.5,
		Visible = false,
		Color = secondaryColor,
		Transparency = 1,
	})
	local nomeCallback = hpData.value9
	local outlineColor = Color3.new(0, 0, 0)
	local UI = Drawing.Fonts.UI
	local nome = nomeCallback("Text", {
		Visible = false,
		Center = true,
		Outline = true,
		OutlineColor = outlineColor,
		Font = UI,
		Size = 13,
		Transparency = 0.97,
	})
	local distCallback = hpData.value9
	local secondaryOutlineColor = Color3.new(0, 0, 0)
	local ui = Drawing.Fonts.UI
	local alternateColor = Color3.fromRGB(220, 220, 220)
	local dist = distCallback("Text", {
		Visible = false,
		Center = true,
		Outline = true,
		OutlineColor = secondaryOutlineColor,
		Font = ui,
		Size = 11,
		Transparency = 0.97,
		Color = alternateColor,
	})
	local rankCallback = hpData.value9
	local alternateOutlineColor = Color3.new(0, 0, 0)
	local font = Drawing.Fonts.UI
	local rank = rankCallback("Text", {
		Visible = false,
		Center = true,
		Outline = true,
		OutlineColor = alternateOutlineColor,
		Font = font,
		Size = 11,
		Transparency = 0.95,
	})
	local toolCallback = hpData.value9
	local additionalOutlineColor = Color3.new(0, 0, 0)
	local secondaryUi = Drawing.Fonts.UI
	local tool = toolCallback("Text", {
		Visible = false,
		Center = true,
		Outline = true,
		OutlineColor = additionalOutlineColor,
		Font = secondaryUi,
		Size = 12,
		Transparency = 0.95,
	})
	local tracer = hpData.value9("Line", {
		Thickness = 1.2,
		Visible = false,
		Transparency = 0.9,
	})

	data[argument] = {
		BoxTop = boxTop,
		BoxBot = boxBot,
		BoxLeft = boxLeft,
		BoxRight = boxRight,
		TLH = tlh,
		TLV = tlv,
		TRH = trh,
		TRV = trv,
		BLH = blh,
		BLV = blv,
		BRH = brh,
		BRV = brv,
		HPBG = hpbg,
		HP = hp,
		Nome = nome,
		Dist = dist,
		Rank = rank,
		Tool = tool,
		Tracer = tracer,
		Bones = {},
		_schema = nil,
		_isR15 = nil,
	}
end
function hpData.value15(dataFlag)
	if not dataFlag then
		return
	end
	local data = {
		dataFlag.BoxTop,
		dataFlag.BoxBot,
		dataFlag.BoxLeft,
		dataFlag.BoxRight,
		dataFlag.TLH,
		dataFlag.TLV,
		dataFlag.TRH,
		dataFlag.TRV,
		dataFlag.BLH,
		dataFlag.BLV,
		dataFlag.BRH,
		dataFlag.BRV,
		dataFlag.HPBG,
		dataFlag.HP,
		dataFlag.Nome,
		dataFlag.Dist,
		dataFlag.Rank,
		dataFlag.Tool,
		dataFlag.Tracer,
	}
	for index, item in ipairs(data) do
		local capturedItem = item

		if capturedItem then
			pcall(function()
				capturedItem.Visible = false
			end)
		end
	end
	for _, item in ipairs(dataFlag.Bones) do
		local capturedV = item

		pcall(function()
			capturedV.Visible = false
		end)
	end
end
hpData.value16 = nil
function hpData.value17(argument)
	local dataFlag = hpData.value13[argument]
	if not dataFlag then
		return
	end
	local data = {
		dataFlag.BoxTop,
		dataFlag.BoxBot,
		dataFlag.BoxLeft,
		dataFlag.BoxRight,
		dataFlag.TLH,
		dataFlag.TLV,
		dataFlag.TRH,
		dataFlag.TRV,
		dataFlag.BLH,
		dataFlag.BLV,
		dataFlag.BRH,
		dataFlag.BRV,
		dataFlag.HPBG,
		dataFlag.HP,
		dataFlag.Nome,
		dataFlag.Dist,
		dataFlag.Rank,
		dataFlag.Tool,
		dataFlag.Tracer,
	}
	for index, item in ipairs(data) do
		local capturedItem = item

		pcall(function()
			capturedItem.Visible = false
			capturedItem:Remove()
		end)
	end
	for _, item in ipairs(dataFlag.Bones) do
		local capturedV = item

		pcall(function()
			capturedV.Visible = false
			capturedV:Remove()
		end)
	end
	hpData.value13[argument] = nil
end
function hpData.value18(secondaryPlayer)
	local bonesFlag = hpData.value13[secondaryPlayer]
	if not bonesFlag then
		return
	end
	for index, item in ipairs(bonesFlag.Bones) do
		local capturedItem = item

		pcall(function()
			capturedItem.Visible = false
			capturedItem:Remove()
		end)
	end
	bonesFlag.Bones = {}
	local Character = secondaryPlayer.Character
	if not Character then
		return
	end
	local isR15Flag = Character:FindFirstChild("UpperTorso") ~= nil
	local schema = isR15Flag and hpData.value12 or hpData.value11
	for _ = 1, #schema do
		table.insert(
			bonesFlag.Bones,
			hpData.value9("Line", {
				Thickness = 1.5,
				Visible = false,
				Transparency = 1,
			})
		)
	end
	bonesFlag._schema = schema
	bonesFlag._isR15 = isR15Flag
end
hpData.value16 = {}
function hpData.value19(argument)
	if argument == hpData.value4 or hpData.value16[argument] then
		return
	end

	local Highlight = Instance.new("Highlight")

	Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	Highlight.FillTransparency = 0.15
	Highlight.OutlineTransparency = 1
	Highlight.Enabled = false
	Highlight.Parent = game:GetService("CoreGui")
	hpData.value16[argument] = Highlight
end
local function updateInstanceProperties(playerAdded)
	local updateInstancePropertiesFlag = hpData.value16[playerAdded]

	if not updateInstancePropertiesFlag then
		return
	end

	local Character = playerAdded.Character

	if hpData.value5.Highlight and (hpData.value8(playerAdded) and Character) then
		local Humanoid = Character:FindFirstChildOfClass("Humanoid")

		if Humanoid and Humanoid.Health > 0 then
			updateInstancePropertiesFlag.Adornee = Character
			updateInstancePropertiesFlag.FillColor = hpData.value6(playerAdded)
			updateInstancePropertiesFlag.Enabled = true

			return
		end
	end

	updateInstancePropertiesFlag.Enabled = false
	updateInstancePropertiesFlag.Adornee = nil
end
function hpData.value20(argument)
	local condition = hpData.value16[argument]

	if condition then
		condition:Destroy()
		hpData.value16[argument] = nil
	end
end
function hpData.value21()
	local ViewportSize = hpData.value1.ViewportSize

	if hpData.value5.TracerOrigem == "Ceu" then
		return Vector2.new(ViewportSize.X / 2, 0)
	end

	if hpData.value5.TracerOrigem == "Topo" then
		return Vector2.new(ViewportSize.X / 2, ViewportSize.Y * 0.15)
	end

	return Vector2.new(ViewportSize.X / 2, ViewportSize.Y)
end
local function onPlayerAdded(playerAdded)
	if playerAdded == hpData.value4 then
		return
	end

	hpData.value14(playerAdded)
	hpData.value19(playerAdded)

	if playerAdded.Character then
		hpData.value18(playerAdded)
	end

	playerAdded.CharacterAdded:Connect(function()
		task.wait(0.6)

		if hpData.value13[playerAdded] then
			hpData.value15(hpData.value13[playerAdded])
		end

		if not hpData.value13[playerAdded] then
			hpData.value14(playerAdded)
		end

		hpData.value18(playerAdded)

		if hpData.value5.Highlight then
			updateInstanceProperties(playerAdded)
		end
	end)
	playerAdded.CharacterRemoving:Connect(function()
		if hpData.value13[playerAdded] then
			hpData.value15(hpData.value13[playerAdded])
		end

		local adorneeCondition = hpData.value16[playerAdded]

		if adorneeCondition then
			adorneeCondition.Enabled = false
			adorneeCondition.Adornee = nil
		end
	end)
end
for _, player in ipairs(hpData.value2:GetPlayers()) do
	onPlayerAdded(player)
end
hpData.value2.PlayerAdded:Connect(onPlayerAdded)
hpData.value2.PlayerRemoving:Connect(function(player)
	hpData.value17(player)
	hpData.value20(player)
end)
RunService.RenderStepped:Connect(function()
	local flag
	local secondaryFlag
	for _, player in ipairs(hpData.value2:GetPlayers()) do
		local capturedPlayer = player

		if capturedPlayer ~= hpData.value4 then
			local iFlag = hpData.value13[capturedPlayer]

			if not iFlag then
				continue
			end

			updateInstanceProperties(capturedPlayer)

			local adorneeCondition = hpData.value16[capturedPlayer]

			if adorneeCondition and adorneeCondition.Enabled then
				adorneeCondition.FillTransparency = math.abs((math.sin(tick() * 3))) * 0.08 + 0.1
			end

			local Character = capturedPlayer.Character
			local input = Character and Character:FindFirstChild("HumanoidRootPart")
			local humanoid = Character

			if Character then
				humanoid = Character:FindFirstChild("Humanoid")
			end

			local head = Character

			if Character then
				head = Character:FindFirstChild("Head")
			end

			local parent = Character

			if Character then
				parent = Character:FindFirstChildOfClass("Tool")
			end

			local color = hpData.value6(capturedPlayer)
			local adornee = parent

			if parent then
				adornee = hpData.value5.ToolV2

				if adornee then
					adornee = hpData.value8(capturedPlayer)

					if adornee then
						adornee = humanoid and humanoid.Health > 0
					end
				end
			end

			if adornee then
				local ESP_SelectionBox = parent:FindFirstChild("ESP_SelectionBox")

				if not ESP_SelectionBox then
					ESP_SelectionBox = Instance.new("SelectionBox")
					ESP_SelectionBox.Name = "ESP_SelectionBox"
					ESP_SelectionBox.Parent = parent
				end

				ESP_SelectionBox.Adornee = parent
				ESP_SelectionBox.Color3 = color
				ESP_SelectionBox.LineThickness = 0.05
				ESP_SelectionBox.SurfaceTransparency = 0.5
				ESP_SelectionBox.SurfaceColor3 = color
				ESP_SelectionBox.Transparency = 0
			elseif Character then
				for _, child in ipairs(Character:GetChildren()) do
					if child:IsA("Tool") then
						local ESP_SelectionBox = child:FindFirstChild("ESP_SelectionBox")

						if ESP_SelectionBox then
							ESP_SelectionBox:Destroy()
						end
					end
				end
			end

			local condition = not input

			if not condition then
				condition = not humanoid

				if not condition then
					condition = not head

					if not condition then
						condition = humanoid.Health <= 0 or not hpData.value8(capturedPlayer)
					end
				end
			end

			if condition then
				hpData.value15(iFlag)

				if adorneeCondition then
					adorneeCondition.Enabled = false
					adorneeCondition.Adornee = nil
				end

				continue
			end

			local humanoidRootPart = hpData.value4.Character

			if humanoidRootPart then
				humanoidRootPart = hpData.value4.Character:FindFirstChild("HumanoidRootPart")
			end

			if humanoidRootPart then
				humanoidRootPart = math.floor((humanoidRootPart.Position - input.Position).Magnitude)
			end

			local text = humanoidRootPart or 0
			local vector, _ = hpData.value1:WorldToViewportPoint(head.Position + Vector3.new(0, 0.65, 0))
			local secondaryVector, _ = hpData.value1:WorldToViewportPoint(input.Position + Vector3.new(0, -3.15, 0))
			local alternateVector, _ = hpData.value1:WorldToViewportPoint(input.Position)

			if vector.Z <= 0 then
				hpData.value15(iFlag)

				continue
			end

			local to = Vector2.new(vector.X, vector.Y)
			local additionalVector = Vector2.new(secondaryVector.X, secondaryVector.Y)
			local secondaryTo = Vector2.new(alternateVector.X, alternateVector.Y)
			local toNumber = math.max(math.abs(to.Y - additionalVector.Y), 6)
			local product = toNumber * 0.5
			local difference = to.X - product / 2
			local y = to.Y
			local fallbackVector = Vector2.new(difference, y)
			local nestedVector = Vector2.new(difference + product, y)
			local innerVector = Vector2.new(difference, y + toNumber)
			local new = Vector2.new
			local sum = y + toNumber
			local outerVector = new(difference + product, sum)

			if hpData.value5.Box then
				hpData.value10(iFlag.BoxTop, fallbackVector, nestedVector, color)
				hpData.value10(iFlag.BoxBot, innerVector, outerVector, color)
				hpData.value10(iFlag.BoxLeft, fallbackVector, innerVector, color)
				hpData.value10(iFlag.BoxRight, nestedVector, outerVector, color)
			else
				iFlag.BoxTop.Visible = false
				iFlag.BoxBot.Visible = false
				iFlag.BoxLeft.Visible = false
				iFlag.BoxRight.Visible = false
			end

			if hpData.value5.BoxV2 then
				local number = math.max(4, (math.floor(math.min(product, toNumber) * 0.25)))

				hpData.value10(
					iFlag.TLH,
					fallbackVector,
					Vector2.new(fallbackVector.X + number, fallbackVector.Y),
					color
				)
				hpData.value10(
					iFlag.TLV,
					fallbackVector,
					Vector2.new(fallbackVector.X, fallbackVector.Y + number),
					color
				)
				hpData.value10(iFlag.TRH, nestedVector, Vector2.new(nestedVector.X - number, nestedVector.Y), color)
				hpData.value10(iFlag.TRV, nestedVector, Vector2.new(nestedVector.X, nestedVector.Y + number), color)
				hpData.value10(iFlag.BLH, innerVector, Vector2.new(innerVector.X + number, innerVector.Y), color)
				hpData.value10(iFlag.BLV, innerVector, Vector2.new(innerVector.X, innerVector.Y - number), color)
				hpData.value10(iFlag.BRH, outerVector, Vector2.new(outerVector.X - number, outerVector.Y), color)
				hpData.value10(iFlag.BRV, outerVector, Vector2.new(outerVector.X, outerVector.Y - number), color)
			else
				iFlag.TLH.Visible = false
				iFlag.TLV.Visible = false
				iFlag.TRH.Visible = false
				iFlag.TRV.Visible = false
				iFlag.BLH.Visible = false
				iFlag.BLV.Visible = false
				iFlag.BRH.Visible = false
				iFlag.BRV.Visible = false
			end

			if hpData.value5.HP then
				local clampedValue = math.clamp(humanoid.Health / math.max(humanoid.MaxHealth, 1), 0, 1)

				if hpData.value5.HPPosicao == "Lado" then
					local number = math.floor(difference) - 5

					iFlag.HPBG.From = Vector2.new(number, y)
					iFlag.HPBG.To = Vector2.new(number, y + toNumber)
					iFlag.HPBG.Visible = true
					iFlag.HP.From = Vector2.new(number, y + toNumber)
					iFlag.HP.To = Vector2.new(number, y + toNumber - toNumber * clampedValue)
					iFlag.HP.Visible = true
				else
					local number = math.floor(y) - 5

					iFlag.HPBG.From = Vector2.new(difference, number)
					iFlag.HPBG.To = Vector2.new(difference + product, number)
					iFlag.HPBG.Visible = true
					iFlag.HP.From = Vector2.new(difference, number)
					iFlag.HP.To = Vector2.new(difference + product * clampedValue, number)
					iFlag.HP.Visible = true
				end
			else
				iFlag.HPBG.Visible = false
				iFlag.HP.Visible = false
			end

			if hpData.value5.Nome then
				iFlag.Nome.Text = capturedPlayer.Name
				iFlag.Nome.Color = color
				iFlag.Nome.Position = Vector2.new(to.X, to.Y - 18)
				iFlag.Nome.Visible = true
			else
				iFlag.Nome.Visible = false
			end

			if hpData.value5.Dist then
				local positionNumber = not hpData.value5.Nome and -18 or -30

				iFlag.Dist.Text = text .. "m"
				iFlag.Dist.Position = Vector2.new(to.X, to.Y + positionNumber)
				iFlag.Dist.Visible = true
			else
				iFlag.Dist.Visible = false
			end

			if hpData.value5.Rank then
				local Team = capturedPlayer.Team

				if Team then
					Team = capturedPlayer.Team.Name
				end

				local rankText = Team or "Sem Cargo"

				iFlag.Rank.Text = rankText
				iFlag.Rank.Color = color

				local Nome = hpData.value5.Nome

				if Nome then
					Nome = hpData.value5.Dist
				end

				local positionNumber = Nome and -42

				if not positionNumber then
					local dist = hpData.value5.Nome

					if not dist then
						dist = hpData.value5.Dist
					end

					positionNumber = not dist and -18 or -30
				end

				iFlag.Rank.Position = Vector2.new(to.X, to.Y + positionNumber)
				iFlag.Rank.Visible = true
			else
				iFlag.Rank.Visible = false
			end

			if hpData.value5.Tool then
				local toolText = "Sem Tool"

				if parent then
					toolText = parent.Name
				end

				iFlag.Tool.Text = toolText
				iFlag.Tool.Color = Color3.fromRGB(255, 220, 80)
				iFlag.Tool.Position = Vector2.new(to.X, additionalVector.Y + 4)
				iFlag.Tool.Visible = true
			else
				iFlag.Tool.Visible = false
			end

			if not hpData.value5.Tracer then
				iFlag.Tracer.Visible = false
				flag = true
			end

			if not flag then
				repeat
					if not secondaryFlag and hpData.value5.TracerAlvo == "Cabeca" then
						if not to then
							secondaryFlag = true
						end
					else
						secondaryFlag = false
						to = secondaryTo
					end
				until not secondaryFlag

				iFlag.Tracer.From = hpData.value21()
				iFlag.Tracer.To = to
				iFlag.Tracer.Color = color
				iFlag.Tracer.Visible = true
			end

			flag = false

			if hpData.value5.Skeleton and iFlag._schema then
				for i, item in ipairs(iFlag._schema) do
					local secondaryI = iFlag.Bones[i]

					if not secondaryI then
						continue
					end

					local firstChild = Character:FindFirstChild(item[1])
					local secondaryFirstChild = Character:FindFirstChild(item[2])

					if not (firstChild and secondaryFirstChild) then
						secondaryI.Visible = false
						task.spawn(function()
							hpData.value18(capturedPlayer)
						end)

						break
					end

					local vector, worldToViewportPoint = hpData.value1:WorldToViewportPoint(firstChild.Position)
					local secondaryVector, flag = hpData.value1:WorldToViewportPoint(secondaryFirstChild.Position)

					if worldToViewportPoint and flag then
						secondaryI.From = Vector2.new(vector.X, vector.Y)
						secondaryI.To = Vector2.new(secondaryVector.X, secondaryVector.Y)
						secondaryI.Color = color
						secondaryI.Visible = true
					else
						secondaryI.Visible = false
					end
				end
			else
				for _, item in ipairs(iFlag.Bones) do
					local capturedV = item

					pcall(function()
						capturedV.Visible = false
					end)
				end
			end

			continue
		end
	end
end)
hpData.value22 = {
	"SintoniaHolder",
	"SintoniaHolder2",
}
hpData.value23 = nil
hpData.value23 = 852768955
function hpData.value24(secondaryPlayer)
	local Team = secondaryPlayer.Team

	if Team then
		Team = secondaryPlayer.Team.Name == "STAFF"
	end

	if Team then
		return true
	end

	if table.find(hpData.value22, secondaryPlayer.Name) then
		return true
	end

	local ok, result = pcall(function()
		return secondaryPlayer:GetRoleInGroup(hpData.value23)
	end)

	if ok then
		if result then
			result = result:lower():find("staff")
		end

		ok = result
	end

	if ok then
		return true
	end

	local success, successResult = pcall(function()
		return secondaryPlayer:GetRankInGroup(hpData.value23)
	end)

	if success then
		success = successResult and successResult > 1
	end

	if success then
		return true
	end

	return false
end
hpData.value25 = false
hpData.value26 = false
hpData.value27 = false
hpData.value28 = "Head"
hpData.value29 = false
hpData.value30 = true
hpData.value31 = true
hpData.value32 = 100
hpData.value33 = Color3.fromRGB(0, 255, 0)
hpData.value34 = {}
hpData.value35 = {}
hpData.value36 = false
hpData.value37 = false
hpData.value38 = false
hpData.value39 = false
hpData.value40 = 0
hpData.value41 = 100
hpData.value42 = 0
hpData.value43 = 0
hpData.value44 = false
hpData.value45 = false
hpData.value46 = false
if HAS_DRAWING then
	hpData.value47 = Drawing.new("Circle")
	hpData.value47.Filled = false
	hpData.value47.Thickness = 1.5
	hpData.value47.Visible = false
else
	hpData.value47 = { Visible = false, Radius = 0, Position = Vector2.zero, Color = Color3.fromRGB(0, 255, 0) }
end
function hpData.value48(secondaryPlayer)
	if not secondaryPlayer or not secondaryPlayer.Character then
		return false
	end

	if secondaryPlayer.Character:FindFirstChildOfClass("ForceField") then
		return true
	end

	local SafeZone = secondaryPlayer:GetAttribute("SafeZone")

	if not SafeZone then
		SafeZone = secondaryPlayer.Character:GetAttribute("SafeZone")
	end

	if SafeZone then
		return true
	end

	return false
end
hpData.value49 = nil
function hpData.value49(input)
	return #hpData.value1:GetPartsObscuringTarget({
		hpData.value1.CFrame.Position,
		input.Position,
	}, {
		hpData.value4.Character,
		input.Parent,
	}) == 0
end
function hpData.value50()
	local alternateFirstChild
	local magnitude = 1e999
	local magnitudeNumber = Vector2.new(hpData.value1.ViewportSize.X / 2, hpData.value1.ViewportSize.Y / 2)
	local additionalFirstChild
	local huge = math.huge
	for _, player in pairs(hpData.value2:GetPlayers()) do
		local character = player ~= hpData.value4

		if character then
			character = player.Character

			if character then
				character = not table.find(hpData.value34, player.Name)

				if character then
					character = not hpData.value27 and hpData.value24(player)
				end
			end
		end

		if character and (not hpData.value44 or not hpData.value48(player)) then
			local firstChild = player.Character:FindFirstChild(hpData.value28)
			local Humanoid = player.Character:FindFirstChild("Humanoid")
			local secondaryFirstChild = firstChild
			if firstChild then
				secondaryFirstChild = Humanoid and not hpData.value31 or Humanoid.Health > 0
			end
			if secondaryFirstChild then
				local isValue29Team = hpData.value29

				if isValue29Team then
					isValue29Team = player.Team == hpData.value4.Team
				end

				if not isValue29Team then
					local vector, worldToViewportPoint = hpData.value1:WorldToViewportPoint(firstChild.Position)

					if worldToViewportPoint and (not hpData.value30 or hpData.value49(firstChild)) then
						local Magnitude = (Vector2.new(vector.X, vector.Y) - magnitudeNumber).Magnitude

						if not (Magnitude > hpData.value32) then
							if hpData.value36 and not hpData.value37 then
								Magnitude = Humanoid.Health
							elseif hpData.value37 and not hpData.value36 then
								Magnitude = (firstChild.Position - hpData.value1.CFrame.Position).Magnitude
							elseif hpData.value36 and hpData.value37 then
								local magnitude = (firstChild.Position - hpData.value1.CFrame.Position).Magnitude

								Magnitude = Humanoid.Health / math.max(Humanoid.MaxHealth, 1) * magnitude
							end

							if table.find(hpData.value35, player.Name) then
								if Magnitude < huge then
									additionalFirstChild = firstChild
									huge = Magnitude
								end
							elseif Magnitude < magnitude then
								alternateFirstChild = firstChild
								magnitude = Magnitude
							end
						end
					end
				end
			end
		end
	end

	return additionalFirstChild or alternateFirstChild
end
function hpData.value51(firstChildFlag)
	if not firstChildFlag then
		firstChildFlag = hpData.value28
	end
	local Character = hpData.value4.Character
	if not Character then
		return nil
	end
	if not Character:FindFirstChild("HumanoidRootPart") then
		return nil
	end
	local magnitudeNumber = Vector2.new(hpData.value1.ViewportSize.X / 2, hpData.value1.ViewportSize.Y / 2)
	local secondaryFirstChild
	local alternateFirstChild
	local huge = math.huge
	local magnitude = 1e999
	for _, player in pairs(hpData.value2:GetPlayers()) do
		if
			player ~= hpData.value4
			and player.Character
			and not table.find(hpData.value34, player.Name)
			and (not hpData.value27 or not hpData.value24(player))
		then
			local isValue29Team = hpData.value29

			if isValue29Team then
				isValue29Team = player.Team == hpData.value4.Team
			end

			if not isValue29Team and (not hpData.value45 or not hpData.value48(player)) then
				local firstChild = player.Character:FindFirstChild(firstChildFlag)
				local Humanoid = player.Character:FindFirstChild("Humanoid")

				if firstChild and Humanoid and (not hpData.value31 or not (Humanoid.Health <= 0)) then
					local vector, worldToViewportPoint = hpData.value1:WorldToViewportPoint(firstChild.Position)

					if worldToViewportPoint and (not hpData.value30 or hpData.value49(firstChild)) then
						local Magnitude = (Vector2.new(vector.X, vector.Y) - magnitudeNumber).Magnitude

						if not (Magnitude > hpData.value32) then
							if hpData.value36 and not hpData.value37 then
								Magnitude = Humanoid.Health
							elseif hpData.value37 and not hpData.value36 then
								Magnitude = (firstChild.Position - hpData.value1.CFrame.Position).Magnitude
							elseif hpData.value36 and hpData.value37 then
								local magnitude = (firstChild.Position - hpData.value1.CFrame.Position).Magnitude

								Magnitude = Humanoid.Health / math.max(Humanoid.MaxHealth, 1) * magnitude
							end

							if table.find(hpData.value35, player.Name) then
								if Magnitude < magnitude then
									alternateFirstChild = firstChild
									magnitude = Magnitude
								end
							elseif Magnitude < huge then
								huge = Magnitude
								secondaryFirstChild = firstChild
							end
						end
					end
				end
			end
		end
	end

	return alternateFirstChild or secondaryFirstChild
end
local ok, result = false, "Silent Aim indisponível neste ambiente"
if type(clonefunction) == "function" and type(newcclosure) == "function" then
	ok, result = pcall(function()
	local OrpheusShared = game:GetService("ReplicatedStorage"):WaitForChild("OrpheusShared", 10)

	if not OrpheusShared then
		return
	end

	local GunSys = OrpheusShared:WaitForChild("GunSys", 10)

	if GunSys then
		GunSys = OrpheusShared.GunSys:WaitForChild("Framework", 10)
	end

	if not GunSys then
		return
	end

	local WeaponRaycastController = GunSys:WaitForChild("WeaponRaycastController", 10)

	if not WeaponRaycastController then
		return
	end

	local lib = require(WeaponRaycastController)
	local callback = clonefunction(lib.PerformRaycast)

	lib.PerformRaycast = newcclosure(function(configArgument, secondaryArgument, tertiaryArgument)
		if not hpData.value26 then
			return callback(configArgument, secondaryArgument, tertiaryArgument)
		end

		if math.random(1, 100) > hpData.value41 then
			return callback(configArgument, secondaryArgument, tertiaryArgument)
		end

		local inputOption = hpData.value28

		if hpData.value42 > 0 then
			inputOption = not (hpData.value43 < hpData.value42) and "Head" or "HumanoidRootPart"
			hpData.value43 = hpData.value43 + 1

			if not (hpData.value43 >= 30) then
			end
		end

		local input = hpData.value51(inputOption)

		if not input then
			return callback(configArgument, secondaryArgument, tertiaryArgument)
		end

		local Character = hpData.value4.Character

		if Character then
			Character = Character:FindFirstChild("HumanoidRootPart")
		end

		if not Character then
			return callback(configArgument, secondaryArgument, tertiaryArgument)
		end

		local Config = configArgument.Config

		if Config then
			Config = configArgument.Config.Spread
		end

		local number = Config or 0

		return input,
			input.Position,
			(Character.Position - input.Position).Unit,
			(
				CFrame.new(workspace.CurrentCamera.Focus.Position, workspace.CurrentCamera.CFrame.LookVector * 500)
				* CFrame.Angles(
					math.rad(-number + math.random() * (number * 2)),
					math.rad(-number + math.random() * (number * 2)),
					0
				)
			).LookVector
	end)
end)
end

data.value1 = ok
data.value2 = result
RunService.RenderStepped:Connect(function()
	if hpData.value39 then
		hpData.value40 = (hpData.value40 + 0.005) % 1
		hpData.value33 = Color3.fromHSV(hpData.value40, 1, 1)
	end

	hpData.value47.Visible = hpData.value25 or hpData.value26 and not hpData.value38
	hpData.value47.Radius = hpData.value32
	hpData.value47.Position = Vector2.new(hpData.value1.ViewportSize.X / 2, hpData.value1.ViewportSize.Y / 2)
	hpData.value47.Color = hpData.value33

	if hpData.value25 then
		local input = hpData.value50()

		if input then
			hpData.value1.CFrame = CFrame.new(hpData.value1.CFrame.Position, input.Position)
		end
	end
end)
hpData.value52 = false
hpData.value53 = 100
hpData.value54 = 0.2
hpData.value55 = 0
RunService.RenderStepped:Connect(function()
	if not hpData.value52 then
		return
	end

	if tick() - hpData.value55 < hpData.value54 then
		return
	end

	local Character = hpData.value4.Character
	local flag = not Character

	if not flag then
		flag = not Character:FindFirstChild("HumanoidRootPart")
	end

	if flag then
		return
	end

	local Tool = Character:FindFirstChildWhichIsA("Tool")

	if not Tool then
		return
	end

	local HumanoidRootPartPosition = Character.HumanoidRootPart.Position

	for _, player in pairs(hpData.value2:GetPlayers()) do
		if player == hpData.value4 or not player.Character or hpData.value46 and hpData.value48(player) then
			continue
		end

		local Humanoid = player.Character:FindFirstChild("Humanoid")
		local Head = player.Character:FindFirstChild("Head")
		local isHumanoidHealth = Humanoid
		local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

		if isHumanoidHealth then
			isHumanoidHealth = Head

			if isHumanoidHealth then
				isHumanoidHealth = HumanoidRootPart

				if HumanoidRootPart then
					isHumanoidHealth = Humanoid.Health > 0
				end
			end
		end

		if isHumanoidHealth and (HumanoidRootPartPosition - HumanoidRootPart.Position).Magnitude <= hpData.value53 then
			tick()
			pcall(function()
				local success, secondaryResult = pcall(function()
					return require(hpData.value3:WaitForChild("Modules"):WaitForChild("ModuleRequiring"))("Network")
				end)

				if success and secondaryResult then
					secondaryResult:Send("HitDeArma", Humanoid, Head, 50, Vector3.new(0, 0, 0), 0, 0)

					return
				end

				local OrpheusGunServer = Tool:FindFirstChild("OrpheusGunServer")

				if OrpheusGunServer then
					OrpheusGunServer = Tool.OrpheusGunServer:FindFirstChild("InflictTarget")
				end

				if OrpheusGunServer then
					Tool.OrpheusGunServer.InflictTarget:FireServer(Humanoid, Head, 50, Vector3.new(0, 0, 0), 0, 0)
				end
			end)

			return
		end
	end
end)
hpData.value56 = {
	RapidFire = false,
	InfiniteAmmo = false,
	InstantReload = false,
	NoRecoil = false,
	NoSpread = false,
	InstantShotgunMinigun = false,
}
function hpData.value57()
	local Character = hpData.value4.Character

	if not Character then
		return nil
	end

	local Tool = Character:FindFirstChildOfClass("Tool")

	if Tool and Tool:FindFirstChild("Cfg") then
		return require(Tool.Cfg)
	end

	return nil
end
RunService.RenderStepped:Connect(function()
	local effectSettings = hpData.value57()

	if effectSettings then
		if hpData.value56.RapidFire then
			effectSettings.FireRate = 0
			effectSettings.AutoFire = true
		end

		if hpData.value56.InfiniteAmmo then
			effectSettings.Ammo = 99999
			effectSettings.MaxAmmo = 99999
			effectSettings.MagSize = 99999
			effectSettings.AmmoPerMag = 99999
			effectSettings.StoredAmmo = 99999
			effectSettings.CurrentAmmo = 99999
		end

		if hpData.value56.InstantReload then
			effectSettings.ReloadTime = 0
			effectSettings.ShotgunReload = false
			effectSettings.ShellClipinSpeed = 0
		end

		if hpData.value56.NoRecoil then
			effectSettings.Recoil = 0
			effectSettings.AngleX = 0
			effectSettings.AngleY = 0
			effectSettings.CameraShakingEnabled = false
			effectSettings.RecoilRedution = 1
		end

		if hpData.value56.NoSpread then
			effectSettings.MaxSpread = 0
			effectSettings.MinSpread = 0
			effectSettings.Spread = 0
		end

		if hpData.value56.InstantShotgunMinigun then
			effectSettings.DelayBeforeFiring = 0
			effectSettings.DelayAfterFiring = 0
			effectSettings.ChargingTime = 0
		end
	end
end)
hpData.value58 = {}
hpData.value58.NoSlowdown = false
hpData.value58.ExplosiveBullets = false
hpData.value59 = Instance.new("ScreenGui")
hpData.value59.Name = "EliteSilent"
hpData.value59.ResetOnSpawn = false
hpData.value59.Parent = game:GetService("CoreGui")
hpData.value60 = Instance.new("Frame")
hpData.value60.Size = UDim2.new(0, 170, 0, 60)
hpData.value60.Position = UDim2.new(0.5, -85, 0.68, 0)
hpData.value60.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
hpData.value60.BorderSizePixel = 0
hpData.value60.Active = true
hpData.value60.Draggable = true
hpData.value60.Parent = hpData.value59
local UICorner = Instance.new("UICorner")

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = hpData.value60
local UIGradient = Instance.new("UIGradient")

UIGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 20, 20)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 10)),
})
UIGradient.Rotation = 45
UIGradient.Parent = hpData.value60
local TextLabel = Instance.new("TextLabel")

TextLabel.Size = UDim2.new(1, -50, 0, 20)
TextLabel.Position = UDim2.new(0, 8, 0, 2)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "SILENT AIM"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Font = Enum.Font.GothamBlack
TextLabel.TextSize = 13
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.Parent = hpData.value60
local uiGradient = Instance.new("UIGradient")

uiGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 40, 40)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30)),
})
uiGradient.Parent = TextLabel
hpData.value61 = Instance.new("TextButton")
hpData.value61.Size = UDim2.new(0, 22, 0, 22)
hpData.value61.Position = UDim2.new(1, -48, 0, 4)
hpData.value61.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
hpData.value61.Text = "🔓"
hpData.value61.TextSize = 12
hpData.value61.Font = Enum.Font.GothamBlack
hpData.value61.TextColor3 = Color3.fromRGB(255, 255, 255)
hpData.value61.Parent = hpData.value60
local uiCorner = Instance.new("UICorner")

uiCorner.CornerRadius = UDim.new(0, 6)
uiCorner.Parent = hpData.value61
local TextButton = Instance.new("TextButton")

TextButton.Size = UDim2.new(0, 22, 0, 22)
TextButton.Position = UDim2.new(1, -24, 0, 4)
TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton.Text = "X"
TextButton.TextSize = 12
TextButton.Font = Enum.Font.GothamBlack
TextButton.TextColor3 = Color3.fromRGB(255, 80, 80)
TextButton.Parent = hpData.value60
local secondaryUiCorner = Instance.new("UICorner")

secondaryUiCorner.CornerRadius = UDim.new(0, 6)
secondaryUiCorner.Parent = TextButton
hpData.value62 = Instance.new("TextButton")
hpData.value62.Size = UDim2.new(0.88, 0, 0, 26)
hpData.value62.Position = UDim2.new(0.06, 0, 0, 28)
hpData.value62.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
hpData.value62.Text = "OFF"
hpData.value62.TextColor3 = Color3.fromRGB(255, 255, 255)
hpData.value62.Font = Enum.Font.GothamBlack
hpData.value62.TextSize = 13
hpData.value62.Parent = hpData.value60
local alternateUiCorner = Instance.new("UICorner")

alternateUiCorner.CornerRadius = UDim.new(0, 7)
alternateUiCorner.Parent = hpData.value62
hpData.value63 = Instance.new("UIGradient")
hpData.value63.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 25, 25)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20)),
})
hpData.value63.Parent = hpData.value62
hpData.value64 = false
hpData.value62.MouseButton1Click:Connect(function()
	hpData.value26 = not hpData.value26

	if hpData.value26 then
		hpData.value62.Text = "ON"
		hpData.value63.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 180, 60)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 40, 15)),
		})

		return
	end

	hpData.value62.Text = "OFF"
	hpData.value63.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 25, 25)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20)),
	})
end)
hpData.value61.MouseButton1Click:Connect(function()
	hpData.value64 = not hpData.value64
	hpData.value60.Draggable = not hpData.value64

	if hpData.value64 then
		hpData.value61.Text = "🔒"

		return
	end

	hpData.value61.Text = "🔓"
end)

local function createFrame()
	local Frame = Instance.new("Frame")

	Frame.Size = UDim2.new(0, 220, 0, 110)
	Frame.Position = UDim2.new(0.5, -110, 0.5, -55)
	Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Frame.BorderSizePixel = 0
	Frame.Parent = hpData.value59

	local uiCorner = Instance.new("UICorner")

	uiCorner.CornerRadius = UDim.new(0, 12)
	uiCorner.Parent = Frame

	local uiGradient = Instance.new("UIGradient")

	uiGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 20, 20)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 10)),
	})
	uiGradient.Rotation = 45
	uiGradient.Parent = Frame

	local parent = Instance.new("TextLabel")

	parent.Size = UDim2.new(1, 0, 0, 30)
	parent.Position = UDim2.new(0, 0, 0, 10)
	parent.BackgroundTransparency = 1
	parent.Text = "Delete Button?"
	parent.TextColor3 = Color3.fromRGB(255, 255, 255)
	parent.Font = Enum.Font.GothamBlack
	parent.TextSize = 16
	parent.Parent = Frame

	local secondaryUiGradient = Instance.new("UIGradient")

	secondaryUiGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 40, 40)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30)),
	})
	secondaryUiGradient.Parent = parent

	local confirmButton = Instance.new("TextButton")

	confirmButton.Size = UDim2.new(0, 90, 0, 32)
	confirmButton.Position = UDim2.new(0, 15, 0, 55)
	confirmButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	confirmButton.Text = "Confirm"
	confirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	confirmButton.Font = Enum.Font.GothamBlack
	confirmButton.TextSize = 13
	confirmButton.Parent = Frame

	local secondaryUiCorner = Instance.new("UICorner")

	secondaryUiCorner.CornerRadius = UDim.new(0, 8)
	secondaryUiCorner.Parent = confirmButton

	local alternateUiGradient = Instance.new("UIGradient")

	alternateUiGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 180, 60)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 40, 15)),
	})
	alternateUiGradient.Parent = confirmButton

	local cancelButton = Instance.new("TextButton")

	cancelButton.Size = UDim2.new(0, 90, 0, 32)
	cancelButton.Position = UDim2.new(0, 115, 0, 55)
	cancelButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	cancelButton.Text = "Cancel"
	cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	cancelButton.Font = Enum.Font.GothamBlack
	cancelButton.TextSize = 13
	cancelButton.Parent = Frame

	local alternateUiCorner = Instance.new("UICorner")

	alternateUiCorner.CornerRadius = UDim.new(0, 8)
	alternateUiCorner.Parent = cancelButton

	local additionalUiGradient = Instance.new("UIGradient")

	additionalUiGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 25, 25)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20)),
	})
	additionalUiGradient.Parent = cancelButton
	confirmButton.MouseButton1Click:Connect(function()
		hpData.value59:Destroy()
	end)
	cancelButton.MouseButton1Click:Connect(function()
		Frame:Destroy()
	end)
end
TextButton.MouseButton1Click:Connect(function()
	createFrame()
end)
hpData.value65 = Instance.new("ScreenGui")
hpData.value65.Name = "EliteAim"
hpData.value65.ResetOnSpawn = false
hpData.value65.Parent = game:GetService("CoreGui")
hpData.value66 = Instance.new("Frame")
hpData.value66.Size = UDim2.new(0, 170, 0, 60)
hpData.value66.Position = UDim2.new(0.5, -85, 0.75, 0)
hpData.value66.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
hpData.value66.BorderSizePixel = 0
hpData.value66.Active = true
hpData.value66.Draggable = true
hpData.value66.Parent = hpData.value65
local additionalUiCorner = Instance.new("UICorner")

additionalUiCorner.CornerRadius = UDim.new(0, 10)
additionalUiCorner.Parent = hpData.value66
local secondaryUiGradient = Instance.new("UIGradient")

secondaryUiGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 20, 20)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 10)),
})
secondaryUiGradient.Rotation = 45
secondaryUiGradient.Parent = hpData.value66
local parent = Instance.new("TextLabel")

parent.Size = UDim2.new(1, -50, 0, 20)
parent.Position = UDim2.new(0, 8, 0, 2)
parent.BackgroundTransparency = 1
parent.Text = "AIMBOT"
parent.TextColor3 = Color3.fromRGB(255, 255, 255)
parent.Font = Enum.Font.GothamBlack
parent.TextSize = 14
parent.TextXAlignment = Enum.TextXAlignment.Left
parent.Parent = hpData.value66
local alternateUiGradient = Instance.new("UIGradient")

alternateUiGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 40, 40)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30)),
})
alternateUiGradient.Parent = parent
hpData.value67 = Instance.new("TextButton")
hpData.value67.Size = UDim2.new(0, 22, 0, 22)
hpData.value67.Position = UDim2.new(1, -48, 0, 4)
hpData.value67.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
hpData.value67.Text = "🔓"
hpData.value67.TextSize = 12
hpData.value67.Font = Enum.Font.GothamBlack
hpData.value67.TextColor3 = Color3.fromRGB(255, 255, 255)
hpData.value67.Parent = hpData.value66
local fallbackUiCorner = Instance.new("UICorner")

fallbackUiCorner.CornerRadius = UDim.new(0, 6)
fallbackUiCorner.Parent = hpData.value67
local xButton = Instance.new("TextButton")

xButton.Size = UDim2.new(0, 22, 0, 22)
xButton.Position = UDim2.new(1, -24, 0, 4)
xButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
xButton.Text = "X"
xButton.TextSize = 12
xButton.Font = Enum.Font.GothamBlack
xButton.TextColor3 = Color3.fromRGB(255, 80, 80)
xButton.Parent = hpData.value66
local nestedUiCorner = Instance.new("UICorner")

nestedUiCorner.CornerRadius = UDim.new(0, 6)
nestedUiCorner.Parent = xButton
hpData.value68 = Instance.new("TextButton")
hpData.value68.Size = UDim2.new(0.88, 0, 0, 26)
hpData.value68.Position = UDim2.new(0.06, 0, 0, 28)
hpData.value68.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
hpData.value68.Text = "OFF"
hpData.value68.TextColor3 = Color3.fromRGB(255, 255, 255)
hpData.value68.Font = Enum.Font.GothamBlack
hpData.value68.TextSize = 13
hpData.value68.Parent = hpData.value66
local innerUiCorner = Instance.new("UICorner")

innerUiCorner.CornerRadius = UDim.new(0, 7)
innerUiCorner.Parent = hpData.value68
hpData.value69 = Instance.new("UIGradient")
hpData.value69.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 25, 25)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20)),
})
hpData.value69.Parent = hpData.value68
hpData.value70 = false
hpData.value68.MouseButton1Click:Connect(function()
	hpData.value25 = not hpData.value25

	if hpData.value25 then
		hpData.value68.Text = "ON"
		hpData.value69.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 180, 60)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 40, 15)),
		})

		return
	end

	hpData.value68.Text = "OFF"
	hpData.value69.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 25, 25)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20)),
	})
end)
hpData.value67.MouseButton1Click:Connect(function()
	hpData.value70 = not hpData.value70
	hpData.value66.Draggable = not hpData.value70

	if hpData.value70 then
		hpData.value67.Text = "🔒"

		return
	end

	hpData.value67.Text = "🔓"
end)

local function secondaryCreateFrame()
	local Frame = Instance.new("Frame")

	Frame.Size = UDim2.new(0, 220, 0, 110)
	Frame.Position = UDim2.new(0.5, -110, 0.5, -55)
	Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Frame.BorderSizePixel = 0
	Frame.Parent = hpData.value65

	local uiCorner = Instance.new("UICorner")

	uiCorner.CornerRadius = UDim.new(0, 12)
	uiCorner.Parent = Frame

	local uiGradient = Instance.new("UIGradient")

	uiGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 20, 20)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 10)),
	})
	uiGradient.Rotation = 45
	uiGradient.Parent = Frame

	local parent = Instance.new("TextLabel")

	parent.Size = UDim2.new(1, 0, 0, 30)
	parent.Position = UDim2.new(0, 0, 0, 10)
	parent.BackgroundTransparency = 1
	parent.Text = "Delete Button?"
	parent.TextColor3 = Color3.fromRGB(255, 255, 255)
	parent.Font = Enum.Font.GothamBlack
	parent.TextSize = 16
	parent.Parent = Frame

	local secondaryUiGradient = Instance.new("UIGradient")

	secondaryUiGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 40, 40)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30)),
	})
	secondaryUiGradient.Parent = parent

	local confirmButton = Instance.new("TextButton")

	confirmButton.Size = UDim2.new(0, 90, 0, 32)
	confirmButton.Position = UDim2.new(0, 15, 0, 55)
	confirmButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	confirmButton.Text = "Confirm"
	confirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	confirmButton.Font = Enum.Font.GothamBlack
	confirmButton.TextSize = 13
	confirmButton.Parent = Frame

	local secondaryUiCorner = Instance.new("UICorner")

	secondaryUiCorner.CornerRadius = UDim.new(0, 8)
	secondaryUiCorner.Parent = confirmButton

	local alternateUiGradient = Instance.new("UIGradient")

	alternateUiGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 180, 60)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 40, 15)),
	})
	alternateUiGradient.Parent = confirmButton

	local cancelButton = Instance.new("TextButton")

	cancelButton.Size = UDim2.new(0, 90, 0, 32)
	cancelButton.Position = UDim2.new(0, 115, 0, 55)
	cancelButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	cancelButton.Text = "Cancel"
	cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	cancelButton.Font = Enum.Font.GothamBlack
	cancelButton.TextSize = 13
	cancelButton.Parent = Frame

	local alternateUiCorner = Instance.new("UICorner")

	alternateUiCorner.CornerRadius = UDim.new(0, 8)
	alternateUiCorner.Parent = cancelButton

	local additionalUiGradient = Instance.new("UIGradient")

	additionalUiGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 25, 25)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20)),
	})
	additionalUiGradient.Parent = cancelButton
	confirmButton.MouseButton1Click:Connect(function()
		hpData.value65:Destroy()
	end)
	cancelButton.MouseButton1Click:Connect(function()
		Frame:Destroy()
	end)
end
xButton.MouseButton1Click:Connect(function()
	secondaryCreateFrame()
end)

local LIB_URL = "https://raw.githubusercontent.com/minhdepzai-v/LibraryRobloc/refs/heads/main/RedzLibrary.lua"
local libraryLoader = loadstring(game:HttpGet(LIB_URL))
if type(libraryLoader) ~= "function" then
	error("KN: RedzLibrary não carregou")
end
local libraryResult = libraryLoader()
if type(libraryResult) ~= "table" or type(libraryResult.MakeWindow) ~= "function" then
	error("KN: RedzLibrary retornou um valor inválido")
end
local fxHubSintoniaRpWindow = libraryResult:MakeWindow({
	Title = "KN • TDME MARCONE",
	SubTitle = "Painel premium • Discord oficial",
	SaveFolder = "KN",
})

-- ===============================
-- KN • TEMA VERMELHO TDME MARCONE
-- ===============================
pcall(function()
	fxHubSintoniaRpWindow.Themes["TDME Red"] = {
		["Color Hub 1"] = ColorSequence.new({
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 8, 8)),
			ColorSequenceKeypoint.new(0.50, Color3.fromRGB(65, 12, 12)),
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 5, 5))
		}),
		["Color Hub 2"] = Color3.fromRGB(38, 8, 8),
		["Color Stroke"] = Color3.fromRGB(110, 25, 25),
		["Color Theme"] = Color3.fromRGB(235, 45, 45),
		["Color Text"] = Color3.fromRGB(255, 245, 245),
		["Color Dark Text"] = Color3.fromRGB(210, 165, 165)
	}
	fxHubSintoniaRpWindow:SetTheme("TDME Red")
end)

local button = {
	Image = "rbxassetid://126903702558789",
	BackgroundTransparency = 0,
}
local new = UDim.new
local AddMinimizeButton = fxHubSintoniaRpWindow.AddMinimizeButton
local cornerRadius = new(35, 1)

AddMinimizeButton(fxHubSintoniaRpWindow, {
	Button = button,
	Corner = {
		CornerRadius = cornerRadius,
	},
})
local tab = fxHubSintoniaRpWindow:MakeTab({
	"PVP",
	"crosshair",
})
fxHubSintoniaRpWindow:SelectTab(tab)
tab:AddButton({
	"Discord Oficial • Copiar Link",
	function()
		setclipboard("https://discord.gg/tdmemarcone")
	end,
})
tab:AddToggle({
	Name = "Aimbot",
	Default = false,
	Callback = function(argument)
		hpData.value25 = argument
	end,
})
tab:AddToggle({
	Name = "Silent Aim",
	Default = false,
	Callback = function(argument)
		hpData.value26 = argument
	end,
})
tab:AddToggle({
	Name = "Kill Aura",
	Default = false,
	Callback = function(argument)
		hpData.value52 = argument
	end,
})
tab:AddSlider({
	Name = "Distancia Kill Aura",
	Min = 10,
	Max = 500,
	Increase = 1,
	Default = 100,
	Callback = function(argument)
		hpData.value53 = argument
	end,
})
tab:AddToggle({
	Name = "Safezone Check Aimbot",
	Default = false,
	Callback = function(argument)
		hpData.value44 = argument
	end,
})
tab:AddToggle({
	Name = "Safezone Check Silent Aim",
	Default = false,
	Callback = function(argument)
		hpData.value45 = argument
	end,
})
tab:AddToggle({
	Name = "Safezone Check Killaura",
	Default = false,
	Callback = function(argument)
		hpData.value46 = argument
	end,
})
tab:AddToggle({
	Name = "No Slowdown",
	Default = false,
	Callback = function(noSlowdown)
		hpData.value58.NoSlowdown = noSlowdown

		if noSlowdown then
			task.spawn(function()
				while hpData.value58.NoSlowdown do
					task.wait(0.2)
					pcall(function()
						local Character = hpData.value4.Character

						if Character then
							local GetChildren = Character.GetChildren

							for _, cfgContainer in pairs(GetChildren(Character)) do
								if cfgContainer:IsA("Tool") then
									local Cfg = cfgContainer:FindFirstChild("Cfg")

									if Cfg then
										local lib = require(Cfg)

										if lib and lib.WalkSpeedRedutionEnabled then
											lib.WalkSpeedRedutionEnabled = false
											lib.WalkSpeedRedution = 0
										end
									end
								end
							end
						end
					end)
				end
			end)
		end
	end,
})
tab:AddToggle({
	Name = "Explosive Bullets",
	Default = false,
	Callback = function(explosiveBullets)
		hpData.value58.ExplosiveBullets = explosiveBullets

		if explosiveBullets then
			task.spawn(function()
				while hpData.value58.ExplosiveBullets do
					task.wait(0.5)
					pcall(function()
						local Character = hpData.value4.Character

						if Character then
							Character = hpData.value4.Character:FindFirstChildOfClass("Tool")
						end

						if Character then
							local Cfg = Character:FindFirstChild("Cfg")

							if Cfg then
								local lib = require(Cfg)

								if lib then
									lib.ExplosiveEnabled = true
									lib.Radius = 15
									lib.BlastPressure = 50000
								end
							end
						end
					end)
				end
			end)

			return
		end

		pcall(function()
			local Character = hpData.value4.Character

			if Character then
				Character = hpData.value4.Character:FindFirstChildOfClass("Tool")
			end

			if Character then
				local Cfg = Character:FindFirstChild("Cfg")

				if Cfg then
					local lib = require(Cfg)

					if lib then
						lib.ExplosiveEnabled = false
					end
				end
			end
		end)
	end,
})
tab:AddToggle({
	Name = "Rapid Fire",
	Default = false,
	Callback = function(rapidFire)
		hpData.value56.RapidFire = rapidFire
	end,
})
tab:AddToggle({
	Name = "Infinite Ammo",
	Default = false,
	Callback = function(infiniteAmmo)
		hpData.value56.InfiniteAmmo = infiniteAmmo
	end,
})
tab:AddToggle({
	Name = "Instant Reload",
	Default = false,
	Callback = function(instantReload)
		hpData.value56.InstantReload = instantReload
	end,
})
tab:AddToggle({
	Name = "No Recoil",
	Default = false,
	Callback = function(noRecoil)
		hpData.value56.NoRecoil = noRecoil
	end,
})
tab:AddToggle({
	Name = "No Spread",
	Default = false,
	Callback = function(noSpread)
		hpData.value56.NoSpread = noSpread
	end,
})
tab:AddToggle({
	Name = "Instant Shotgun Minigun",
	Default = false,
	Callback = function(instantShotgunMinigun)
		hpData.value56.InstantShotgunMinigun = instantShotgunMinigun
	end,
})
tab:AddToggle({
	Name = "Ignorar ADM",
	Default = false,
	Callback = function(argument)
		hpData.value27 = argument
	end,
})
tab:AddDropdown({
	Name = "Focar em",
	Options = {
		"Head",
		"HumanoidRootPart",
	},
	Default = "Head",
	Callback = function(argument)
		hpData.value28 = argument
	end,
})
tab:AddSlider({
	Name = "Hit Chance",
	Min = 0,
	Max = 100,
	Increase = 1,
	Default = 100,
	Callback = function(argument)
		hpData.value41 = argument
	end,
})
tab:AddSlider({
	Name = "Tiros no Corpo antes da Cabeca",
	Min = 0,
	Max = 29,
	Increase = 1,
	Default = 0,
	Callback = function(argument)
		hpData.value42 = argument
	end,
})
tab:AddToggle({
	Name = "Ignorar Paredes",
	Default = true,
	Callback = function(argument)
		hpData.value30 = argument
	end,
})
tab:AddToggle({
	Name = "Ignorar Mortos",
	Default = true,
	Callback = function(argument)
		hpData.value31 = argument
	end,
})
tab:AddToggle({
	Name = "Ignorar Amigos",
	Default = false,
	Callback = function(argument)
		hpData.value29 = argument
	end,
})
tab:AddToggle({
	Name = "Ocultar FOV",
	Default = false,
	Callback = function(argument)
		hpData.value38 = argument
	end,
})
tab:AddToggle({
	Name = "FOV Colorido",
	Default = false,
	Callback = function(value39Flag)
		hpData.value39 = value39Flag

		if not value39Flag then
			Color3.fromRGB(0, 255, 0)
		end
	end,
})
tab:AddToggle({
	Name = "Prio Menos Vida",
	Default = false,
	Callback = function(argument)
		hpData.value36 = argument
	end,
})
tab:AddToggle({
	Name = "Prio Mais Perto",
	Default = false,
	Callback = function(argument)
		hpData.value37 = argument
	end,
})
tab:AddSlider({
	Name = "Tamanho FOV",
	Min = 1,
	Max = 600,
	Increase = 1,
	Default = 100,
	Callback = function(argument)
		hpData.value32 = argument
	end,
})
tab:AddDropdown({
	Name = "Ignorar Jogadores",
	Options = { "Nenhum" },
	Default = "Nenhum",
	Callback = function(argument)
		if argument == "Nenhum" then
			hpData.value34 = {}

			return
		end

		hpData.value34 = { argument }
	end,
})
tab:AddDropdown({
	Name = "Priorizar Jogadores",
	Options = { "Nenhum" },
	Default = "Nenhum",
	Callback = function(argument)
		if argument == "Nenhum" then
			hpData.value35 = {}

			return
		end

		hpData.value35 = { argument }
	end,
})
tab:AddButton({
	"Puxar Todos",
	function()
		loadstring(
			game:HttpGet("https://raw.githubusercontent.com/Fx-login/Bring-all/refs/heads/main/Bring%20all%20sintonia")
		)()
	end,
})
local secondaryTab = fxHubSintoniaRpWindow:MakeTab({
	"ESP",
	"eye",
})
secondaryTab:AddToggle({
	Name = "Box ESP",
	Default = false,
	Callback = function(box)
		hpData.value5.Box = box
	end,
})
secondaryTab:AddToggle({
	Name = "Box V2 Cantos",
	Default = false,
	Callback = function(argument)
		hpData.value5.BoxV2 = argument
	end,
})
secondaryTab:AddToggle({
	Name = "Barra de Vida",
	Default = false,
	Callback = function(hp)
		hpData.value5.HP = hp
	end,
})
secondaryTab:AddToggle({
	Name = "Nome",
	Default = false,
	Callback = function(nome)
		hpData.value5.Nome = nome
	end,
})
secondaryTab:AddToggle({
	Name = "Distancia",
	Default = false,
	Callback = function(dist)
		hpData.value5.Dist = dist
	end,
})
secondaryTab:AddToggle({
	Name = "Rank Time",
	Default = false,
	Callback = function(rank)
		hpData.value5.Rank = rank
	end,
})
secondaryTab:AddToggle({
	Name = "Tracer Linhas",
	Default = false,
	Callback = function(tracer)
		hpData.value5.Tracer = tracer
	end,
})
secondaryTab:AddToggle({
	Name = "Skeleton",
	Default = false,
	Callback = function(skeleton)
		hpData.value5.Skeleton = skeleton
	end,
})
secondaryTab:AddToggle({
	Name = "Chams Highlight",
	Default = false,
	Callback = function(highlight)
		hpData.value5.Highlight = highlight
	end,
})
secondaryTab:AddToggle({
	Name = "Nome da Tool Texto",
	Default = false,
	Callback = function(tool)
		hpData.value5.Tool = tool
	end,
})
secondaryTab:AddToggle({
	Name = "ESP Tool Highlight",
	Default = false,
	Callback = function(argument)
		hpData.value5.ToolV2 = argument
	end,
})
secondaryTab:AddToggle({
	Name = "Team Check Apenas Inimigos",
	Default = false,
	Callback = function(teamCheck)
		hpData.value5.TeamCheck = teamCheck
	end,
})
secondaryTab:AddToggle({
	Name = "Rainbow Mode RGB",
	Default = false,
	Callback = function(rgb)
		hpData.value5.RGB = rgb
	end,
})
secondaryTab:AddDropdown({
	Name = "Posicao da Barra de Vida",
	Options = {
		"Lado",
		"Baixo",
	},
	Default = "Lado",
	Callback = function(hpPosicao)
		hpData.value5.HPPosicao = hpPosicao
	end,
})
secondaryTab:AddDropdown({
	Name = "Origem do Tracer",
	Options = {
		"Chao",
		"Topo",
		"Ceu",
	},
	Default = "Chao",
	Callback = function(tracerOrigem)
		hpData.value5.TracerOrigem = tracerOrigem
	end,
})
secondaryTab:AddDropdown({
	Name = "Alvo do Tracer",
	Options = {
		"Tronco",
		"Cabeca",
	},
	Default = "Tronco",
	Callback = function(tracerAlvo)
		hpData.value5.TracerAlvo = tracerAlvo
	end,
})
