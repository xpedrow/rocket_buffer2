local PlayerPrefs = import('@Config/PlayerPrefs')

addEventHandler("onResourceStart", root, function () 
  outputDebugString("Resource BoilerPlate: Server Side.")
  outputDebugString(PlayerPrefs.awesomeConfig)
end)