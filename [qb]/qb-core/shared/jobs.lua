QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.QBJobsStatus = false -- true: integrate qb-jobs into the whole of qb-core | false: treat qb-jobs as an add-on resource.
QBShared.Jobs = {} -- All of below has been migrated into qb-jobs
if QBShared.QBJobsStatus then return end
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civil',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Mi Propio Jefe',
                payment = 20
            },
        },
	},
	['police'] = {
		label = 'Departamento de Policia',
        type = "leo",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recluta',
                payment = 200
            },
			['1'] = {
                name = 'Raso',
                payment = 275
            },
            ['2'] = {
                name = 'Cabo',
                payment = 350
            },
			['3'] = {
                name = 'Oficial',
                payment = 450
            },
			['4'] = {
                name = 'Sargento',
                payment = 575
            },
			['5'] = {
                name = 'Sargento Mayor',
                payment = 800
            },
            ['6'] = {
                name = 'Teniente Segundo',
                payment = 1000
            },
            ['7'] = {
                name = 'Teniente Primero',
                payment = 1250
            },
            ['8'] = {
                name = 'Capitán',
                isboss = true,
                payment = 1400
            },
            ['9'] = {
                name = 'Coronel',
                isboss = true,
                payment = 1650
            },
            ['10'] = {
                name = 'Mayor General',
                isboss = true,
                payment = 1800
            },
        },
	},
	['ambulance'] = {
		label = 'EMS',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Enfermero',
                payment = 250
            },
			['1'] = {
                name = 'Paramedico',
                payment = 400
            },
			['2'] = {
                name = 'Doctor',
                payment = 700
            },
			['3'] = {
                name = 'Cirujano',
                payment = 1000
            },
             ['4'] = {
                name = 'Psicologo',
                payment = 1200
            },
			['5'] = {
                name = 'Ministro de Salud',
				isboss = true,
                payment = 1500
            },
        },
	},
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'House Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Broker',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Driver',
                payment = 75
            },
			['2'] = {
                name = 'Event Driver',
                payment = 100
            },
			['3'] = {
                name = 'Sales',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
    ['bus'] = {
		label = 'Bus',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
		},
	},
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Finance',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	-- ['mechanic'] = {
	-- 	label = 'Mechanic',
    --     type = "mechanic",
	-- 	defaultDuty = true,
	-- 	offDutyPay = false,
	-- 	grades = {
    --         ['0'] = {
    --             name = 'Recruit',
    --             payment = 50
    --         },
	-- 		['1'] = {
    --             name = 'Novice',
    --             payment = 75
    --         },
	-- 		['2'] = {
    --             name = 'Experienced',
    --             payment = 100
    --         },
	-- 		['3'] = {
    --             name = 'Advanced',
    --             payment = 125
    --         },
	-- 		['4'] = {
    --             name = 'Manager',
	-- 			isboss = true,
    --             payment = 150
    --         },
    --     },
	-- },
    ['biembo'] = {
        label = 'Biembo Auto Parts',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {name = 'Aprendiz', payment = 100},
            ['1'] = {name = 'Mecánico', payment = 200},
            ['2'] = {name = 'Mano Derecha', isboss = true, payment = 300},
            ['3'] = {name = 'Boss', isboss = true, payment = 400},
        },
    },
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
      ['mechanic3'] = {
        label = 'Mechanic3',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {name = 'Apprentice', payment = 100},
            ['1'] = {name = 'Employee', payment = 200},
            ['2'] = {name = 'Boss', isboss = true, payment = 300},
        },
    },
    ['mechanic4'] = {
        label = 'Mechanic4',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {name = 'Apprentice', payment = 100},
            ['1'] = {name = 'Employee', payment = 200},
            ['2'] = {name = 'Boss', isboss = true, payment = 300},
        },
    },
    ['mechanic5'] = {
        label = 'Mechanic5',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {name = 'Apprentice', payment = 100},
            ['1'] = {name = 'Employee', payment = 200},
            ['2'] = {name = 'Boss', isboss = true, payment = 300},
        },
    },

    
	['judge'] = {
		label = 'Honorary',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                payment = 100
            },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Associate',
                payment = 50
            },
        },
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 50
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 50
            },
        },
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 50
            },
        },
	},
	-- ['hotdog'] = {
	-- 	label = 'Hotdog',
	-- 	defaultDuty = true,
	-- 	offDutyPay = false,
	-- 	grades = {
    --         ['0'] = {
    --             name = 'Sales',
    --             payment = 50
    --         },
    --     },
	-- },
}
