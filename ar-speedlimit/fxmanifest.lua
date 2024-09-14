
-- Manifest data
fx_version 'bodacious'
games {'gta5'}

-- Resource stuff
name 'ar-speedlimit'
description 'A QB-Core script designed to allow vehicles of different classes to have a different "maximum" speed limit compared to eachother.'
version 'v0.0.1'
author 'Anderson Rice'

-- Leave this set to '0' to prevent compatibility issues 
-- and to keep the save files your users.
experimental_features_enabled '0'

client_script 'client.lua'

shared_scripts {
	'config.lua',
}
