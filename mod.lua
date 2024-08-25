function data()
return {
	info = {
		minorVersion = 1,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "deutschland", "germany", "db", "waggon", "Ballast", },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },

        params = {
			{
				key = "schotterfake",
				name = _("Fake_schotter_wagen"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_schotter_desc"),
				defaultIndex = 0,
			},	
        },
	},
	options = {
	},
	
	runFn = function (settings, modParams)
	local params = modParams[getCurrentModId()]

        local hidden = {
			["1_fake.mdl"] = true, 
			["2_fake.mdl"] = true, 
			["3_fake.mdl"] = true, 
			["4_fake.mdl"] = true, 
        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/Schotterwagen_([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["schotterfake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end

		addModifier( "loadModel", metadataHandler )
	end
	}
end
