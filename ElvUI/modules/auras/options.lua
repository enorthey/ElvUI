local E, L, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, ProfileDB, GlobalDB

E.Options.args.auras = {
	type = "group",
	name = L["Auras"],
	order = 2,
	get = function(info) return E.db.auras[ info[#info] ] end,
	set = function(info, value) E.db.auras[ info[#info] ] = value end,
	args = {
		intro = {
			order = 1,
			type = "description",
			name = L["AURAS_DESC"],
		},
		general = {
			order = 2,
			type = "group",
			name = L["General"],
			guiInline = true,
			args = {	
				enable = {
					order = 1,
					name = L["Enable"],
					desc = L["Enable Auras near minimap"],
					type = "toggle",
					get = function(info) return E.global.auras.enable end,					
					set = function(info, value) E.global.auras.enable = value; StaticPopup_Show("GLOBAL_RL") end
				},
				size = {
					order = 2,
					name = L["Size"],
					desc = L["Controls the size of the auras."],
					type = "range",
					min = 30, max = 45, step = 1,
					set = function(info, value) E.db.auras.size = value; StaticPopup_Show("GLOBAL_RL") end
				},	
				perRow = {
					order = 3,
					name = L["Per Row"],
					desc = L["Controls the number of auras per row."],
					type = "range",
					min = 10, max = 20, step = 1,
					set = function(info, value) E.db.auras.perRow = value; StaticPopup_Show("GLOBAL_RL") end
				},	
			},
		},					
	},
}