return {
   on = {
      timer = {
         'at 0:03'
      }
   },
   execute = function(domoticz)
      if (domoticz.variables('RenskeMsg').value == 1) then
         domoticz.variables('RenskeMsg').set(0)
		 domoticz.log('Reset RenskeMsg', domoticz.LOG_INFO)
      end
   end
}