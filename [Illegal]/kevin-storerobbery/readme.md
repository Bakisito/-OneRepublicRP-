# Dependencies

- qb-target https://github.com/qbcore-framework/qb-target
- ox_lib https://github.com/overextended/ox_lib/releases/tag/v2.21.0
- ps/cd dispatch
- polyzone

# Install 

# Go to [qb] > qb-smallresources > server > logs.lua by default you should already have a 'shoprobbery' in there is not add the snippet below

```lua
['washer'] = 'put your discord channel webhook here',
```

* If you are unsure how to get a webhook this link can help you https://docs.gitlab.com/ee/user/project/integrations/discord_notifications.html

# Next you need to add the new cameras in a few places:

* First qb-policejob > config.lua > Config.SecurityCameras add the following

```lua
    [35] = {label = "Ammunation Paleto Bay", coords = vector3(-327.192, 6075.098, 33.932), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
    [36] = {label = "Ammunation Sandy Shores", coords = vector3(1697.104, 3751.289, 37.182), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
    [37] = {label = "Ammunation Zancudo River", coords = vector3(-1115.097, 2689.658, 21.031), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
    [38] = {label = "Ammunation MorningWood", coords = vector3(-1312.986, -388.425, 39.173), r = {x = -25.0, y = 0.0, z = -130.78}, canRotate = true, isOnline = true},
    [39] = {label = "Ammunation Little Seoul", coords = vector3(-666.128, -943.683, 24.306), r = {x = -35.0, y = 0.0, z = -5.78}, canRotate = true, isOnline = true},
    [40] = {label = "Ammunation PillBox Hill", coords = vector3(15.516, -1113.699, 32.274), r = {x = -35.0, y = 0.0, z = -35.78}, canRotate = true, isOnline = true},
    [41] = {label = "Ammunation Cypress Flats", coords = vector3(814.063, -2148.912, 32.096), r = {x = -35.0, y = 0.0, z = 130.78}, canRotate = true, isOnline = true},
    [42] = {label = "Ammunation La Mesa", coords = vector3(846.255, -1025.181, 30.672), r = {x = -35.00, y = 0.00, z = 140.00}, canRotate = true, isOnline = true},
```

* Secondly if you use ps-mdt go into the ui > img > paste the image within the image folder
* Thirdly within the ui folder open the dashboard.html file in whatever code editor you use an add the following within <div class="cams-item">

```lua
    <div class="cams-items" id="35"><img class="cams-image" src="img/ammunation.webp">Ammunation Paleto Bay</div>
    <div class="cams-items" id="36"><img class="cams-image" src="img/ammunation.webp">Ammunation Sandy Shores</div>
    <div class="cams-items" id="37"><img class="cams-image" src="img/ammunation.webp">Ammunation Zancudo River</div>
    <div class="cams-items" id="38"><img class="cams-image" src="img/ammunation.webp">Ammunation MorningWood</div>
    <div class="cams-items" id="39"><img class="cams-image" src="img/ammunation.webp">Ammunation Little Seoul</div>
    <div class="cams-items" id="40"><img class="cams-image" src="img/ammunation.webp">Ammunation PillBox Hill</div>
    <div class="cams-items" id="41"><img class="cams-image" src="img/ammunation.webp">Ammunation Cypress Flats</div>
    <div class="cams-items" id="42"><img class="cams-image" src="img/ammunation.webp">Ammunation La Mesa</div>
```