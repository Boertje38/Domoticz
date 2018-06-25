return {
   on= {
      devices = {
         'TabletMarc'
      }
   },
   execute = function(domoticz, switch)
      if (switch.state == 'Off') then
         domoticz.openURL('https://api.telegram.org/botID/sendMessage?chat_id=123&text=Tablet van Marc is uit')
      end
   end
}