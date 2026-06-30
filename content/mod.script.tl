local mod = {}

mod.postRunFn = function(captureParams : NativeLuaTable, configDict : {{string, string}}, allModParams : {string : {string : integer}} )

	local fake_hide: {{string}} = {
		[1] = {
			"mw_schotterwagen::/vehicle/waggon/schotterwagen/schotterwagen_1_fake.mdl",
			"mw_schotterwagen::/vehicle/waggon/schotterwagen/schotterwagen_2_fake.mdl",
			"mw_schotterwagen::/vehicle/waggon/schotterwagen/schotterwagen_3_fake.mdl",
			"mw_schotterwagen::/vehicle/waggon/schotterwagen/schotterwagen_4_fake.mdl",
		},
		[2] = { }
	}
	
	local selectedfilter_fake: integer = allModParams[getCurrentModId()].schotterwagen_fake

	for _, v in ipairs(fake_hide[selectedfilter_fake]) do
		api.res.modelRep.setVisible(api.res.modelRep.find(v), false)
	end
	

end

return mod