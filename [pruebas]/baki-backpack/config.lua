Config = Config or {}

local animations = {
     backpack = {
          dict = 'amb@world_human_hiker_standing@female@base',
          anim = 'base',
          bone = 'Back',
          persistentAnimation = false,
          attaching_position = {
               x = -0.15,
               y = -0.15,
               z = -0.05,
               x_rotation = -5.0,
               y_rotation = 90.0,
               z_rotation = 0.0,
          }
     },
     backpack2 = {
          dict = 'amb@world_human_hiker_standing@female@base',
          anim = 'static',
          bone = 'Back',
          attaching_position = {
               x = 0.07,
               y = -0.15,
               z = -0.05,
               x_rotation = 0.0,
               y_rotation = 90.0,
               z_rotation = 175.0,
          }
     },
     backpack3 = {
          dict = 'amb@world_human_hiker_standing@female@base',
          anim = 'static',
          bone = 'Back',
          attaching_position = {
               x = 0.04,
               y = -0.20,
               z = 0.0,
               x_rotation = 0.0,
               y_rotation = 0.0,
               z_rotation = 0.0,
          }
     },
     backpack4 = {
          dict = 'amb@world_human_hiker_standing@female@base',
          anim = 'static',
          bone = 'Back',
          attaching_position = {
               x = 0.06,
               y = -0.24,
               z = 0.0,
               x_rotation = 0.0,
               y_rotation = 0.0,
               z_rotation = 0.0,
          }
     },
     backpack5 = {
          dict = 'amb@world_human_hiker_standing@female@base',
          anim = 'static',
          bone = 'Back',
          attaching_position = {
               x = 0.06,
               y = -0.24,
               z = 0.0,
               x_rotation = 0.0,
               y_rotation = 0.0,
               z_rotation = 0.0,
          }
     },
     backpack6 = {
          dict = 'amb@world_human_hiker_standing@female@base',
          anim = 'static',
          bone = 'Back',
          attaching_position = {
               x = 0.06,
               y = -0.24,
               z = 0.0,
               x_rotation = 0.0,
               y_rotation = 0.0,
               z_rotation = 0.0,
          }
     },
     backpack7 = {
          dict = 'amb@world_human_hiker_standing@female@base',
          anim = 'static',
          bone = 'Back',
          attaching_position = {
               x = 0.06,
               y = -0.24,
               z = 0.0,
               x_rotation = 0.0,
               y_rotation = 0.0,
               z_rotation = 0.0,
          }
     },
     backpack8 = {
          dict = 'amb@world_human_hiker_standing@female@base',
          anim = 'static',
          bone = 'Back',
          attaching_position = {
               x = 0.06,
               y = -0.24,
               z = 0.0,
               x_rotation = 0.0,
               y_rotation = 0.0,
               z_rotation = 0.0,
          }
     },

     suitcase2 = {
          dict = 'missheistdocksprep1hold_cellphone',
          anim = 'static',
          bone = 'RightHand',
          attaching_position = {
               x = 0.15,
               y = 0.0,
               z = 0.0,
               x_rotation = -10.0,
               y_rotation = 280.0,
               z_rotation = 45.0,
          }
     },
     -- paramedicbag = {
     --      dict = 'missheistdocksprep1hold_cellphone',
     --      anim = 'static',
     --      bone = 'RightHand',
     --      attaching_position = {
     --           x = 0.29,
     --           y = -0.05,
     --           z = 0.0,
     --           x_rotation = -25.0,
     --           y_rotation = 280.0,
     --           z_rotation = 75.0,
     --      }
     -- },
   
}

local props = {
     backpack = {
          model = 'sf_prop_sf_backpack_01a',
          animation = animations.backpack
     },
     backpack2 = {
          model = 'prop_michael_backpack',
          animation = animations.backpack2
     },
     backpack3 = {
          model = 'komi_bagblue',
          animation = animations.backpack3
     },
     backpack4 = {
          model = 'komi_bagred',
          animation = animations.backpack4
     },
     backpack5 = {
          model = 'komi_bagviolet',
          animation = animations.backpack5
     },
     backpack6 = {
          model = 'komi_bagyellow',
          animation = animations.backpack6
     },
     backpack7 = {
          model = 'komi_bagsnorlax',
          animation = animations.backpack7
     },
     backpack8 = {
          model = 'komi_bagibai',
          animation = animations.backpack8
     },

     suitcase = {
          model = 'prop_ld_suitcase_01',
          animation = animations.suitcase2
     },
     suitcase2 = {
          model = 'ch_prop_ch_security_case_02a',
          animation = animations.suitcase2
     },
     -- paramedicbag = {
     --      model = 'xm_prop_smug_crate_s_medical',
     --      animation = animations.paramedicbag
     -- },
  
}

-- which slots are your hot bar
Config.Hotbar = {
     1, 2, 3, 4, 5,
}

Config.duration = {
     open = 1, --sec
     close = 1
}

Config.not_allowed_to_carry_multiple_backpacks = true
Config.maximum_allowed = 2

-- (important) do not use both prop and cloth at same time just one.

Config.items = {
     ['backpack'] = {
          slots = 6,
          size = 20000,
          prop = props.backpack,

     },
     ['backpack2'] = {
          slots = 6,
          size = 20000,
          prop = props.backpack2,

     },
     ['backpack3'] = {
          slots = 6,
          size = 20000,
          prop = props.backpack3,

     },
     ['backpack4'] = {
          slots = 6,
          size = 20000,
          prop = props.backpack4,

     },
     ['backpack5'] = {
          slots = 6,
          size = 20000,
          prop = props.backpack5,

     },
     ['backpack6'] = {
          slots = 6,
          size = 20000,
          prop = props.backpack6,

     },
     ['backpack7'] = {
          slots = 6,
          size = 20000,
          prop = props.backpack7,

     },
     ['backpack8'] = {
          slots = 6,
          size = 20000,
          prop = props.backpack8,

     },
     ['briefcase'] = {
          slots = 3,
          size = 10000,
          locked = 'password',
          prop = props.suitcase2,
          remove_when_using_weapon = true
     },
     -- ['paramedicbag'] = {
     --      slots = 10,
     --      size = 40000,
     --      prop = props.paramedicbag,
     --      remove_when_using_weapon = true
     -- },

}

Config.Blacklist_items = {
     active = true,
     list = {
          'weapon_rpg',
          'backpack1',
          'backpack2',
          'backpack3',
          'backpack4',
          'backpack5',
          'backpack6',
          'backpack7',
          'backpack8',
          'briefcase'
          
     }
     -- backpack1 = {
     --      ['lockpick'] = true
     -- }
}

Config.Whitelist_items = {
     paramedicbag = {
          ['firstaid'] = true,
          ['bandage'] = true,
          ['ifaks'] = true,
          ['painkillers'] = true,
     },
     fishicebox = {},
}

Config.whitelist = {
     lockpick = {
          active = true,
          jobs = { 'police' },
          citizenid = {}
     }
}
