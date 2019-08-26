--[[----------------------------------------------------------------------------

  Application Name:
  Binarize

  Summary:
  Binarization of image with a global threshold.

  How to Run:
  Starting this sample is possible either by running the app (F5) or
  debugging (F7+F10). Setting breakpoint on the first row inside the 'main'
  function allows debugging step-by-step after 'Engine.OnStarted' event.
  Results can be seen in the image viewer on the DevicePage.
  Restarting the Sample may be necessary to show images after loading the webpage.
  To run this Sample a device with SICK Algorithm API and AppEngine >= V2.5.0 is
  required. For example SIM4000 with latest firmware. Alternatively the Emulator
  in AppStudio 2.3 or higher can be used.

  More Information:
  Tutorial "Algorithms - Filtering and Arithmetic".

------------------------------------------------------------------------------]]
--Start of Global Scope---------------------------------------------------------

print('AppEngine Version: ' .. Engine.getVersion())

-- Creating viewer
local viewer = View.create()

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function main()
  viewer:clear()
  local img = Image.load('resources/Binarize.bmp')
  viewer:addImage(img)
  viewer:present()
  Script.sleep(1500) -- for demonstration purpose only

  -- Binarization
  local img2 = img:binarize(0, 60)
  viewer:addImage(img2:invert()) -- Invert to preserve original image polarity
  viewer:present()
  print('App finished.')
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register('Engine.OnStarted', main)

--End of Function and Event Scope--------------------------------------------------
