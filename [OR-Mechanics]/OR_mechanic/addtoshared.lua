-- Items

['repairkit'] 		= {['name'] = 'repairkit', 			['label'] = 'Repair Kit', 			['weight'] = 0, ['type'] = 'item', ['image'] = 'repairkit.png', 		['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Repair Kit'},	
['advrepairkit'] 	= {['name'] = 'advrepairkit', 		['label'] = 'Adv Repair Kit', 		['weight'] = 0, ['type'] = 'item', ['image'] = 'advrepairkit.png', 		['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Adv Repair Kit'},
['carjack']         = {['name'] = 'carjack', 	        ['label'] = 'Car Jack', 	        ['weight'] = 0, ['type'] = 'item', ['image'] = 'carjack.png', 	        ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Car Jack'}, 	
['car_hood'] 		= {['name'] = 'car_hood', 			['label'] = 'Car Hood', 			['weight'] = 0, ['type'] = 'item', ['image'] = 'car_hood.png', 		    ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Car Hood'}, 	
['car_trunk'] 	    = {['name'] = 'car_trunk', 		    ['label'] = 'Car Trunk', 		    ['weight'] = 0, ['type'] = 'item', ['image'] = 'car_trunk.png', 	    ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true,  ['combinable'] = nil, ['description'] = 'Car Trunk'}, 	
['car_door'] 		= {['name'] = 'car_door', 			['label'] = 'Car Door', 			['weight'] = 0, ['type'] = 'item', ['image'] = 'car_door.png', 		    ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Car Door'}, 	
['car_wheel'] 	    = {['name'] = 'car_wheel', 	        ['label'] = 'Car Wheel', 		    ['weight'] = 0, ['type'] = 'item', ['image'] = 'car_wheel.png', 	    ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Car Wheel'}, 	
['scrap_metal'] 	= {['name'] = 'scrap_metal', 		['label'] = 'Scrap Metal', 		    ['weight'] = 0, ['type'] = 'item', ['image'] = 'scrap_metal.png', 	    ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true,  ['combinable'] = nil, ['description'] = 'Scrap Metal'}, 	
['rubber'] 		    = {['name'] = 'rubber', 		    ['label'] = 'Rubber', 				['weight'] = 0, ['type'] = 'item', ['image'] = 'rubber.png', 		    ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true,  ['combinable'] = nil, ['description'] = 'Rubber'}, 		
['plastic'] 		= {['name'] = 'plastic', 			['label'] = 'Plastic', 			    ['weight'] = 0, ['type'] = 'item', ['image'] = 'plastic.png', 		    ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Plastic'}, 		
['electric_scrap'] 	= {['name'] = 'electric_scrap', 	['label'] = 'Electric Scrap', 		['weight'] = 0, ['type'] = 'item', ['image'] = 'electric_scrap.png', 	['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Electric Scrap'},
['glass'] 	        = {['name'] = 'glass', 		        ['label'] = 'Glass', 			    ['weight'] = 0, ['type'] = 'item', ['image'] = 'glass.png', 		    ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Glass'},	
['aluminium'] 	    = {['name'] = 'aluminium', 		    ['label'] = 'Aluminium', 		    ['weight'] = 0, ['type'] = 'item', ['image'] = 'aluminium.png', 	    ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Aluminium'}},
['copper'] 	        = {['name'] = 'copper', 		    ['label'] = 'Copper', 			    ['weight'] = 0, ['type'] = 'item', ['image'] = 'copper.png', 		    ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Copper'},		
['steel'] 	        = {['name'] = 'steel', 		        ['label'] = 'Steel', 		        ['weight'] = 0, ['type'] = 'item', ['image'] = 'steel.png', 	        ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Steel'}, 		

-- Jobs

['mechanic1'] = {
    label = 'Mechanic1',
    defaultDuty = false,
    offDutyPay = false,
    grades = {
        ['0'] = {name = 'Apprentice', payment = 100},
        ['1'] = {name = 'Employee', payment = 200},
        ['2'] = {name = 'Boss', isboss = true, payment = 300},
    },
},

['mechanic2'] = {
    label = 'Mechanic2',
    defaultDuty = false,
    offDutyPay = false,
    grades = {
        ['0'] = {name = 'Apprentice', payment = 100},
        ['1'] = {name = 'Employee', payment = 200},
        ['2'] = {name = 'Boss', isboss = true, payment = 300},
    },
},