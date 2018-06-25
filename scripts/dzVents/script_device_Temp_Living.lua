local devicesToCheck = {
	{ ['name'] = 'TempWoonkamer', ['threshold'] = 15 },
	{ ['name'] = 'RP3 Temp', ['threshold'] = 15 }
--	{ ['name'] = 'Bathroom temperature', ['threshold'] = 20 }*/
}

return {
	active = true,
	on = {
		timer = {'every minute'}
	},
	execute = function(domoticz)
		
		local message=""

		for i, deviceToCheck in pairs(devicesToCheck) do
			local name = deviceToCheck['name']
			local threshold = deviceToCheck['threshold']
			local minutes = domoticz.devices(name).lastUpdate.minutesAgo
		--local minutes = domoticz.devices('Woonkamer').lastUpdate.minutesAgo
		
		--domoticz.log('minutes: ' .. minutes, domoticz.LOG_ERROR)
        --domoticz.telegram('Temperatuur woonkamer batterij leeg ('.. minutes ..')')
		
			if ( minutes > threshold) then
				message = message .. 'Device ' ..
						name .. ' seems to be dead. No heartbeat for at least ' ..
						minutes .. ' minutes.\r'
			end
		end

		if (string.len(message) > 3) then
		    --domoticz.telegram('Temperatuur woonkamer batterij leeg')
			domoticz.email('Dead devices', message, 'me@address.nl')
			domoticz.log('Dead devices found: ' .. message, domoticz.LOG_ERROR)
		end
	end
	
}
