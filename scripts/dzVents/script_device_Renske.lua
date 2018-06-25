return {
   on= {
      devices = {
         'Telefoon Renske'
      }
   },
   execute = function(domoticz, switch)
      if ((switch.state == 'Off') and (domoticz.variables('RenskeMsg').value == 0))then
         domoticz.openURL('https://api.telegram.org/botID/sendMessage?chat_id=123&text=Renske haar telefoon is uit')
		 domoticz.variables('RenskeMsg').set(1)
      elseif ((switch.state == 'On') and (domoticz.variables('RenskeMsg').value == 1))then
			domoticz.variables('RenskeMsg').set(0)
      end
   end
}