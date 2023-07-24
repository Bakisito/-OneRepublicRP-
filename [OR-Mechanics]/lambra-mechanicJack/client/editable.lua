QBCore = exports["qb-core"]:GetCoreObject()


--Functions that gets triggered on Actions ( You can write custom code )

function onVehicleRaised(vehicle)

end

function onVehicleLowered(vehicle)

end

function onWheelTakenOff(vehicle, wheel, isFlat)
    --wheel (0 = LEFT FRONT, 4 = LEFT REAR, 1 = RIGHT FRONT, 5 = RIGHT REAR)

end

function onWheelPutOn(vehicle, wheel)
    --wheel (0 = LEFT FRONT, 2 = LEFT REAR, 1 = RIGHT FRONT, 3 = RIGHT REAR)
end