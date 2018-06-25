return {
   on= {
      devices = {
         'Telefoon Jorike'
      }
   },
   execute = function(domoticz, switch)
      if (switch.state == 'Off') then
         domoticz.openURL('https://api.telegram.org/botID/sendMessage?chat_id=123&text=Telefoon van Jorike is uit')
      end
   end
}