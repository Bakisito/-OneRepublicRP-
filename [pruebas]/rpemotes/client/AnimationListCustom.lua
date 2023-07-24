-- Emotes you add in the file will automatically be added to AnimationList.lua
-- If you have multiple custom list files they MUST be added between AnimationList.lua and Emote.lua in fxmanifest.lua!
-- Don't change 'CustomDP' it is local to this file!

local CustomDP = {}

CustomDP.Expressions = {}
CustomDP.Walks = {}
CustomDP.Shared = {}
CustomDP.Dances = {

    ["dance10"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_down", "Dance 10", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance11"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_left", "Dance 11", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance12"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_right", "Dance 12", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance13"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_left_up", "Dance 13", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance14"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_right_up", "Dance 14", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceslow6"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_left_up", "Dance Slow 6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceslow7"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_right_up", "Dance Slow 7", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceslow2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_left", "Dance Slow 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceslow3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_right", "Dance Slow 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceclubq"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_left_up", "Dance Club 17", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceclubr"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_right_up", "Dance Club 18", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceclubs"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_left", "Dance Club 19", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceclubt"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_right", "Dance Club 20", AnimationOptions =
    {
        EmoteLoop = true,
    }},

    ["danceclubu"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_down", "Dance Club 21", AnimationOptions =
    {
        EmoteLoop = true,
    }},

    ["danceclubv"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up", "Dance Club 22", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceclubw"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_left_down", "Dance Club 23", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceclubx"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_right_down", "Dance Club 24", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancecluby"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_left_up", "Dance Club 25", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceclubz"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_right_up", "Dance Club 26", AnimationOptions =
    {
        EmoteLoop = true,
    }},

    ["danceslow4"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_left", "Dance Slow 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceslow5"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_right", "Dance Slow 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceclub1"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_left_up", "Dance Club 27", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceclub2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_right_up", "Dance Club 28", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceclub3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_left_down", "Dance Club 29", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceclub4"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_right_down", "Dance Club 30", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceclub5"] = {"anim@amb@nightclub@djs@black_madonna@", "dance_b_idle_a_blamadon", "Dance Club 31", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancef7"] = {"anim@amb@nightclub@djs@black_madonna@", "dance_b_idle_d_blamadon", "Dance F7", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancef13"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^1", "Dance F13", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance16"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^4", "Dance 16", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance17"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^5", "Dance 17", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance18"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^6", "Dance 18", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance19"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^1", "Dance 19", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance20"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^2", "Dance 20", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance21"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^3", "Dance 21", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance22"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^4", "Dance 22", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance23"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^5", "Dance 23", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dj10"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_a_dixon", "DJ 10", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancef6"] = {"anim@amb@nightclub@djs@solomun@", "sol_trans_out_to_rt_a_sol", "Dance F6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancef8"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^3", "Dance F8", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancef9"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^2", "Dance F9", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancef10"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^3", "Dance F10", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancef11"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^5", "Dance F11", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancef12"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^6", "Dance F12", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["salsa"] = {"custom@salsa", "salsa", "Salsa", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["maraschino"] = {"custom@maraschino", "maraschino", "Maraschino", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["Macarena"] = {"custom@makarena", "makarena", "Macarena", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gangnamstyle"] = {"custom@gangnamstyle", "gangnamstyle", "Gangnam Style", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["crunch"] = {"custom@circle_crunch", "circle_crunch", "Circle Crunch", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["armwave"] = {"custom@armwave", "armwave", "Arm Wave", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["armswirl"] = {"custom@armswirl", "armswirl", "Arms Swirl", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["wannaseme"] = {"custom@wanna_see_me", "wanna_see_me", "Wanna See Me Do My Dance", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    ["rollie"] = {"custom@rollie", "rollie", "Rollie", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    ["tiktok"] = {"custom@pullup", "pullup", "TikTok Dance", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    ["tiktok2"] = {"custom@downward_fortnite", "downward_fortnite", "TikTok Dance 2", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    ["billybounce"] = {"custom@billybounce", "billybounce", "Billy Bounce", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    ["twerking3"] = {"divined@drillb2@new", "twerkmocap2", "Twerking #3", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["twerking2"] = {"divined@drillb2@new", "splitstwerk2", "Twerking #2", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["twerking"] = {"divined@drillb2@new", "twerking", "Twerking #1", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["sturdy"] = {"divined@drillb2@new", "sturdy", "Get Sturdy #1", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["walknstep"] = {"divined@drillb2@new", "walknstep", "Walk N Step", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["sturdyground"] = {"divined@drillb2@new", "sturdyground", "Get Sturdy #2", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["toomanyglockies"] = {"divined@drillb2@new", "toomanyglockies", "Too Many Glockies", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["hitemwithdat"] = {"divined@drillb2@new", "hitemwithdat", "Hit 'Em With Dat", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["slutmeout"] = {"divined@drillb2@new", "slutmeout", "Slut Me Out", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["toosieslide"] = {"divined@drillb2@new", "toosieslide", "Toosie Slide", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dancepartyf"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_female^1", "Dance Party", AnimationOptions =  
    {  
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["dancepartyf2"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_female^6", "Dance Party 2", AnimationOptions =  
    {  
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["danceparty3"] = {"anim@mp_player_intcelebrationfemale@heart_pumping", "heart_pumping", "Dance Party 3", AnimationOptions =  
    {  
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["dancedisco"] = {"anim@mp_player_intcelebrationfemale@uncle_disco", "uncle_disco", "Dance Disco", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["jkhaby"] = {"missarmenian3@simeon_tauntsidle_b", "areyounotman", "Khaby · Special", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["dj11"] = {"anim@mp_player_intcelebrationmale@dj", "dj", "DJ 11", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["dj12"] = {"anim@amb@nightclub@djs@switch@dixn_djset_switchover@", "dix_end_bg_female1", "DJ 12", AnimationOptions =
    {
       EmoteLoop = true
    }},

    ["dj13"] = {"mini@strip_club@idles@dj@base", "base", "DJ 13" , AnimationOptions = {
        EmoteMoving = false,
        EmoteLoop = true
     }},
    ["bellydance"] = {"custom@bellydance", "bellydance", "Belly Dance", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},

    ["jlowdance"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "low_center", "Low Dance · Female ", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["jlowdance2"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "high_center", "Low Dance · Female", AnimationOptions =
       {
        EmoteLoop = true
     }},

    ["dj14"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", "trans_dance_facedj_li_to_mi_11_v1_male^3", "DJ 14", AnimationOptions =
    {
        EmoteLoop = true,
    }},

    ["bunnyhop"] = {"divined@rpack@new", "bunnyhop", "Bunnyhop", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["yeet"] = {"divined@rpack@new", "yeet", "Yeet", AnimationOptions =
    {
        EmoteLoop = true
    }}, 
    ["hiphopslide"] = {"custom@hiphop_slide", "hiphop_slide", "HipHop Slide", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["hiphop1"] = {"custom@hiphop1", "hiphop1", "HipHop 1", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["hiphop2"] = {"custom@hiphop2", "hiphop2", "HipHop 2", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["hiphop3"] = {"custom@hiphop3", "hiphop3", "HipHop 3", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = false,
    }},
    ["hiphopold"] = {"custom@hiphop90s", "hiphop90s", "HipHop Old", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},	-- 10
    ["bellydance2"] = {"custom@bellydance2", "bellydance2", "Belly Dance 2", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["footwork"] = {"custom@footwork", "footwork", "Footwork", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["headspin"] = {"custom@headspin", "headspin", "Headspin", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = false,
    }},
    ["pumpup"] = {"custom@hiphop_pumpup", "hiphop_pumpup", "Hiphop Pumpup", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},	-- 20
    ["hiphop_yeah"] = {"custom@hiphop_yeah", "hiphop_yeah", "Hiphop Yeah", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = false,
    }},
    ["salsatime"] = {"custom@salsatime", "salsatime", "Salsa Time", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["samba"] = {"custom@samba", "samba", "Samba", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["shockdance"] = {"custom@shockdance", "shockdance", "Shock Dance", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["specialdance"] = {"custom@specialdance", "specialdance", "Special Dance", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["toetwist"] = {"custom@toetwist", "toetwist", "Toe twist", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["crossbounce"] = {"custom@crossbounce", "crossbounce", "Cross bounce", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["dontstart"] = {"custom@dont_start", "dont_start", "Dont Start", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},	-- 30
    ["floss"] = {"custom@floss", "floss", "Floss", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["orangejustice"] = {"custom@orangejustice", "orangejustice", "Orange Justice", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["renegade"] = {"custom@renegade", "renegade", "Renegade", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["rickroll"] = {"custom@rickroll", "rickroll", "Rick Roll", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["savage"] = {"custom@savage", "savage", "Savage", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["sayso"] = {"custom@sayso", "sayso", "Say So", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["takel"] = {"custom@take_l", "take_l", "Take the L", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["slide"] = {"custom@toosie_slide", "toosie_slide", "Tootsie Slide", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["clock"] = {"custom@around_the_clock", "around_the_clock", "Around the clock", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["dancemoves"] = {"custom@dancemoves", "dancemoves", "Fornite moves", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},	-- 40
    ["discodance"] = {"custom@disco_dance", "disco_dance", "Disco Dance", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["electroshuffle"] = {"custom@electroshuffle_original", "electroshuffle_original", "Electro Shuffle", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["electroshuffle2"] = {"custom@electroshuffle", "electroshuffle", "Electro Shuffle 2", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["fresh"] = {"custom@fresh_fortnite", "fresh_fortnite", "Fresh", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["gylphic"] = {"custom@gylphic", "gylphic", "Glyphic", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["hitit"] = {"custom@hitit", "hitit", "Hit It", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["inparty"] = {"custom@in_da_party", "in_da_party", "In Da Party", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["robotdance"] = {"custom@robotdance_fortnite", "robotdance_fortnite", "Robot Dance", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["frightfunk"] = {"custom@frightfunk", "frightfunk", "Fright Funk", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["gloss"] = {"custom@gloss", "gloss", "Gloss", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},	-- 50
    ["lastforever"] = {"custom@last_forever", "last_forever", "Last Forever", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["smoothmoves"] = {"custom@smooth_moves", "smooth_moves", "Smooth moves", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["introducing"] = {"custom@introducing", "introducing", "Introducing...", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
}
CustomDP.AnimalEmotes = {}
CustomDP.Exits = {}
CustomDP.Emotes = { 
    ["monkey"] = {"missfbi5ig_30monkeys", "monkey_a_freakout_loop", "Monkey", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["monkey2"] = {"missfbi5ig_30monkeys", "monkey_c_freakout_loop", "Monkey 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["reverence"] = {"missfra2", "lamar_base_idle", "Reverence", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["sleep2"] = {"missheist_jewel", "cop_on_floor", "Sleep 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["sitchair7"] = {"misslester1aig_3main", "air_guitar_01_b", "Sit Chair 7", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        ----ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
    }},
    ["sitchair11"] = {"misslester1aig_5intro", "boardroom_intro_f_b", "Sit Chair 11", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        ----ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
        
    }},
    ["sitchair12"] = {"misslester1aig_5intro", "boardroom_intro_f_c", "Sit Chair 12", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        ----ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
    }},
    ["repent"] = {"misstrevor1", "threaten_ortega_endloop_ort", "Repent", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["sitchair13"] = {"misstrevor3", "bike_chat_a_1", "Sit Chair 13", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        ----ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
        
    }},
    ["sitchair17"] = {"switch@michael@smoking2", "loop", "Sit Chair 17", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        ----ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
        
    }},
    ["sitchair18"] = {"switch@trevor@pushes_bodybuilder", "001426_03_trvs_5_pushes_bodybuilder_idle_bb2", "Sit Chair 18", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        ------ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
        
    }},
    ["sitchair19"] = {"timetable@reunited@ig_10", "base_jimmy", "Sit Chair 19", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        ------ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
        
    }},
    ["sitchair20"] = {"anim@heists@fleeca_bank@hostages@intro", "intro_loop_ped_a", "Sit Chair 20", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        ------ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
        
    }},
    ["sitchair21"] = {"anim@amb@office@pa@male@", "greetng_b_intro", "Sit Chair 21", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        ------ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
        
    }},
    ["sitmafia3"] = {"anim@amb@office@boss@female@", "idle_d", "Sit Mafia 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        ------ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
    }},
    ["sitchair22"] = {"timetable@ron@ig_3_p3", "ig_3_p3_base", "Sit Chair 22", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        ------ExitEmote = "offchair",
        --ExitEmoteType = "Exits",

        
    }},
    ["sitchair23"] = {"timetable@trevor@smoking_meth@idle_a", "idle_a", "Sit Chair 23", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        ------ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
    }},
    ["sexo"] = {"rcmpaparazzo_2", "shag_loop_poppy", "Sexo F", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sexo2"] = {"rcmpaparazzo_2", "shag_loop_a", "Sexo M", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sexo3"] = {"anim@mp_player_intcelebrationfemale@air_shagging", "air_shagging", "Sexo 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["reactidk"] = {"custom@what_idk", "what_idk", "Reaction I Don't Know", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        EmoteDuration = 2500,
    }},
    ["jlmic"] = {"anim@veh@lowrider@std@ds@arm@music@hiphopidle_a", "idle", "Listen Music In Car", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteDuration = 2500,
    }},
    ["jgotc"] = {"random@getawaydriver@thugs", "base_a", "Get Off The Car", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["jlookplan"] = {"missheist_agency2aig_4", "look_plan_c_worker2", "Look Plan", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 5000,
    }},
    ["jgangdrink"] = {"amb@world_human_drinking_fat@beer@male@base", "base", "Gang Drink", AnimationOptions =
    {
       Prop = 'prop_cs_beer_bot_40oz_03',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
    }},
    ["jgangdrink2"] = {"amb@world_human_drinking_fat@beer@male@idle_a", "idle_b", "Gang Drink 2", AnimationOptions =
    {
       Prop = 'prop_cs_beer_bot_40oz_03',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
    }},
    ["jthanks"] = {"random@arrests", "thanks_male_05", "Thanks", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["jtextingmale"] = {"amb@world_human_stand_mobile_fat@male@text@base", "base", "Texting · Male", AnimationOptions =
    {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true 
    }},
    ["sitchair14"] = {"timetable@reunited@ig_10", "isthisthebest_jimmy", "Sit Chair 14", AnimationOptions =
    {
       EmoteLoop = true
       ------ExitEmote = "offchair",
       --ExitEmoteType = "Exits"
    }},
    ["sitchair15"] = {"timetable@michael@on_sofabase", "sit_sofa_base", "Sit Chair 15", AnimationOptions =
    {
       EmoteLoop = true
       ------ExitEmote = "offchair",
       --ExitEmoteType = "Exits",
    }},
    ["sitchair16"] = {"timetable@trevor@smoking_meth@base", "base", "Sit Chair 16", AnimationOptions =
    {
       EmoteLoop = true
       ------ExitEmote = "offchair",
       --ExitEmoteType = "Exits",
    }},
    ["jstandingt"] = {"amb@world_human_bum_standing@twitchy@base", "base", "Standing Twitchy", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["jstandingfit"] = {"amb@world_human_jog_standing@male@fitbase", "base", "Standing Fit", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["jgabgtaunt"] = {"switch@franklin@gang_taunt_p1", "gang_taunt_loop_lamar", "Gang Taunt", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteLoop = true
    }},
    ["tvshow3"] = {"fos_ep_1_p1-0", "cs_lazlow_dual-0", "TV Show 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["tvshow4"] = {"fos_ep_1_p1-0", "csb_imran_dual-0", "TV Show 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["tvshow5"] = {"fos_ep_1_p1-1", "cs_lazlow_dual-1", "TV Show 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tvshow6"] = {"fos_ep_1_p5-2", "csb_william_dual-2", "TV Show 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["tvshow7"] = {"impexp_int_l1-11", "mp_m_waremech_01_dual-11", "TV Show 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["tvshow"] = {"amb@prop_human_seat_computer@male@react_shock", "forward", "TV Show", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tvshow2"] = {"amb@prop_human_seat_bar@male@elbows_on_bar@idle_b", "idle_d", "TV Show 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["sleep3"] = {"missheist_agency3amcs_4b", "crew_dead_crew2", "Sleep 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["sleep4"] = {"missheist_jewel", "gassed_npc_customer1", " Sleep 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["sleep5"] = {"missheist_jewel", "gassed_npc_customer2", "Sleep 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["sleep6"] = {"missheist_jewel", "gassed_npc_customer3", " Sleep 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["sleep7"] = {"missheist_jewel", "gassed_npc_customer4", " Sleep 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["lieabout"] = {"missmic2ig_11", "mic_2_ig_11_a_p_one", "Lie About", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tiedup2"] = {"missprologueig_2", "idle_on_floor_gaurd", "Tied up 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tiedup"] = {"missprologueig_2", "idle_outside_cuboard_gaurd", "Tied up", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["sleep8"] = {"missprologueig_6", "lying_dead_brad", "Sleep 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["sleep9"] = {"missprologueig_6", "lying_dead_player0", "Sleep p", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["schizophrenia"] = {"misstrevor1ig_3", "action_b", "Schizophrenia", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["numb"] = {"mp_arrest_paired", "crook_p1_idle", "Numb", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["numb2"] = {"mp_cop_miss", "dazed", "Numb 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["namaste2"] = {"fam_4_int_alt1-17", "cs_amandatownley_dual-17", "Namaste 2", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = true,
    }},
    ["namaste3"] = {"fos_ep_1_p1-26", "csb_imran_dual-26", "Namaste 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["oraljob"] = {"misscarsteal2pimpsex", "pimpsex_hooker", "Oral Job", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},
    ["oraljob"] = {"misscarsteal2pimpsex", "pimpsex_punter", "Oral Job 2", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["tiedup3"] = {"random@burial", "b_burial", "Tied up 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["sitchair8"] = {"anim@amb@nightclub@smoking@", "blunt_idle_a", "Sit Chair 8", AnimationOptions =
    {    
        Prop = 'p_cs_joint_02',
        PropBone = 28422,
        PropPlacement = {0.0800003, -0.004999998, -0.035, 175.5002, 311.0003, 232.0},
        EmoteLoop = true,
        EmoteMoving = false,
        ----ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
        
    }},
    ["sitchair9"] = {"anim@amb@nightclub@smoking@", "blunt_idle_b", "Sit Chair 9", AnimationOptions =
    {    
        Prop = 'p_cs_joint_02',
        PropBone = 28422,
        PropPlacement = {0.0800003, -0.004999998, -0.035, 175.5002, 311.0003, 232.0},
        EmoteLoop = true,
        EmoteMoving = false,
        ----ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
        
    }},


    ["mc"] = {"anim@amb@nightclub@lazlow@ig1_vip@", "clubvip_dlg_tonymctony_laz", "MC", AnimationOptions =
    {    
        Prop = 'p_ing_microphonel_01',
        PropBone = 57005,
        PropPlacement = {0.1249999, 0.03, -0.005000002, 87.10002, 149.8, 200.8},
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},


    ["jump"] = {"anim@arena@celeb@flat@solo@no_props@", "jump_d_player_a", "Jump", AnimationOptions =
    {    
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["jump2"] = {"anim@arena@celeb@flat@solo@no_props@", "jump_c_player_a", "Jump 2", AnimationOptions =
    {    
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["jump3"] = {"anim@arena@celeb@flat@solo@no_props@", "jump_b_player_a", "Jump 3", AnimationOptions =
    {    
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["jump4"] = {"anim@arena@celeb@flat@solo@no_props@", "jump_a_player_a", "Jump 4", AnimationOptions =
    {    
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["leanbar2"] = {"switch@michael@pier", "pier_lean_smoke_idle", "Lean Bar 2", AnimationOptions =
    {   
        Prop = 'prop_cs_ciggy_01',
        PropBone = 58867,
        PropPlacement = {0.0599999, 0.005, -0.015, 40.29999, 78.3, 124.1},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["leanbar3"] = {"switch@michael@pier", "pier_lean_smoke_idle", "Lean Bar 3", AnimationOptions =
    {   
        Prop = 'p_cs_joint_02',
        PropBone = 58867,
        PropPlacement = {0.0599999, 0.005, -0.015, 40.29999, 78.3, 124.1},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["leanbar4"] = {"switch@michael@pier", "pier_lean_smoke_idle", "Lean Bar 4", AnimationOptions =
    {   
        Prop = 'prop_cigar_03',
        PropBone = 58867,
        PropPlacement = {0.06499989, 0.015, -0.01, 0.0, 78.3, 299.6001},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["sitmafia"] = {"safe@michael@ig_3", "cigar_idle_b_michael", "Sit Mafia", AnimationOptions =
    {   
        Prop = 'prop_cigar_03',
        PropBone = 58867,
        PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        ----ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
        
    }},
    ["smell2"] = {"safe@trevor@ig_8", "ig_8_huff_gas_player", "Smell 2", AnimationOptions =
    {   
        Prop = 'prop_cigar_03',
        PropBone = 13700,
        PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["sitchair10"] = {"mini@strip_club@wade@", "leadin_loop_idle_a_stripper_a", "Sit Chair 10", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        ----ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
        
    }},

    ["sitmafia2"] = {"mini@strip_club@wade@", "leadin_loop_idle_a_wade", "Sit Mafia 2", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        ----ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
    }},

    ["lean7"] = {"missarmenian1leadinoutarm_1_ig_14_leadinout", "leadin_loop", "Lean 7", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["pee3"] = {"missbigscore1switch_trevor_piss", "piss_loop", "Pee 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["lean8"] = {"misscarsteal1car_1_ext_leadin", "base_driver1", "Lean 8", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["pee4"] = {"misscarsteal2peeing", "peeing_loop", "Pee 4", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["leanbar5"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Lean Bar 5", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["lean9"] = {"missclothing", "idle_a", "Lean 9", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["lean10"] = {"missclothing", "idle_b", "Lean 10", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["lean6"] = {"missclothing", "idle_c", "Lean 6", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["sadly"] = {"missfam4leadinoutmcs2", "tracy_loop", "Sadly", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["jdepressed"] = {"oddjobs@bailbond_hobodepressed", "base", "Depressed", AnimationOptions =
    {
       EmoteMoving = true,
    }},
    ["jcarlowrider"] = {"anim@veh@lowrider@low@front_ds@arm@base", "sit", "Lowrider Style · Car", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteLoop = true
    }},
    ["jcarlowrider2"] = {"anim@veh@lowrider@std@ds@arm@music@mexicanidle_a", "idle", "Lowrider Mexican Style · Car", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteLoop = true
    }},
    ["jreactiona"] = {"random@shop_robbery_reactions@", "absolutely", "Reaction Absolutely", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jreactanger"] = {"random@shop_robbery_reactions@", "anger_a", "Reaction Anger", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jreactwhy"] = {"random@shop_robbery_reactions@", "is_this_it", "Reaction Why", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jreactscrew"] = {"random@shop_robbery_reactions@", "screw_you", "Reaction Screw You", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jreactshock"] = {"random@shop_robbery_reactions@", "shock", "Reaction Shock", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jreactgoodc"] = {"missclothing", "good_choice_storeclerk", "Reaction Good Choice", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jtrynewc"] = {"clothingtie", "try_tie_neutral_c", "Try New Clothes", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jtrynewc2"] = {"clothingtie", "try_tie_neutral_d", "Try New Clothes 2", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jreacteasy"] = {"gestures@m@car@std@casual@ds", "gesture_easy_now", "Reaction Easy Now", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jreactiwill"] = {"gestures@m@car@std@casual@ds", "gesture_i_will", "Reaction I will", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jreactnoway"] = {"gestures@m@car@std@casual@ds", "gesture_no_way", "Reaction No Way", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jreactbye"] = {"gestures@f@standing@casual", "gesture_bye_hard", "Reaction Bye Hard", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jreacthello"] = {"gestures@f@standing@casual", "gesture_hello", "Reaction Hello", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jlookatplayer"] = {"friends@frl@ig_1", "look_lamar", "Look At Player", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jreactgreat"] = {"mp_cp_welcome_tutgreet", "greet", "Great", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jfakepunch"] = {"missarmenian2", "fake_punch_walk_by_lamar", "Fake Punch", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 5000,
    }},
    ["jreactdamn"] = {"missheist_jewel", "damn", "Reaction Damn", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jimtellingyou"] = {"missheist_jewel", "im_telling_you", "I'm telling you", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jreactno"] = {"missheist_jewel", "despair", "Reaction No", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jdontkillme"] = {"missheist_jewel", "manageress_kneel_loop", "Dont Kill Me", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jtryshirtn"] = {"clothingshirt", "try_shirt_negative_a", "Try Shirt Negative", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jtryshirtp"] = {"clothingshirt", "try_shirt_positive_a", "Try Shirt Positive", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jtryshoes"] = {"clothingshoes", "try_shoes_positive_d", "Try Shoes", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jtryshoes2"] = {"clothingshoes", "try_shoes_positive_c", "Try Shoes 2", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jtryg"] = {"mp_clothing@female@glasses", "try_glasses_positive_a", "Try Glasses · Female", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jpickup"] = {"pickup_object", "pickup_low", "Pick Up", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jstretchl"] = {"switch@franklin@bed", "stretch_long", "Stretch Long", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jhos"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_a", "Hang Out Street · Male", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["jhos2"] = {"amb@world_human_hang_out_street@male_c@base", "base", "Hang Out Street 2 · Male", AnimationOptions =
    {
       EmoteLoop = true
    }},

    ["jgready"] = {"switch@franklin@getting_ready", "002334_02_fras_v2_11_getting_dressed_exit", "Getting Ready", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jlao"] = {"move_clown@p_m_two_idles@", "fidget_look_at_outfit", "Look At Outfits", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 6000,
    }},
    ["jtoilet"] = {"switch@trevor@on_toilet", "trev_on_toilet_loop", "Have A Shit", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 5000,
    }},
    ["jtoilet2"] = {"timetable@trevor@on_the_toilet", "trevonlav_struggleloop", "Have A Shit 2", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 5000,
    }},
    ["jcovermale2"] = {"amb@code_human_cower@male@base", "base", "Cover · Male", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["jsunbathem"] = {"amb@world_human_sunbathe@male@back@idle_a", "idle_c", "Sunbathe · Male", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true
    }},
    ["jsunbathem2"] = {"amb@world_human_sunbathe@male@front@base", "base", "Sunbathe 2 · Male", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["jwtf"] = {"mini@triathlon", "wot_the_fuck", "Wot The Fuck", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jucdt"] = {"mini@triathlon", "u_cant_do_that", "U Cant Do That", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jwarmup"] = {"mini@triathlon", "ig_2_gen_warmup_01", "Warmup", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 5000,
    }},
    ["jwarmup2"] = {"mini@triathlon", "ig_2_gen_warmup_02", "Warmup 2", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 5000,
    }},
    ["jwarmup3"] = {"mini@triathlon", "jog_idle_f", "Warmup 3", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 5000,
    }},
    ["jwarmup4"] = {"mini@triathlon", "jog_idle_e", "Warmup 4", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 5000,
    }},
    ["jddealer"] = {"amb@world_human_drug_dealer_hard@male@base", "base", "Drug Dealer · Male", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["jcheckw"] = {"amb@world_human_bum_wash@male@high@base", "base", "Check Water", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 5000,
    }},
    ["jmstretch"] = {"oddjobs@assassinate@multi@", "idle_a", "Muscle Stretch", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 5000,
    }},
    ["pickup2"] = {"custom@pickfromground", "pickfromground", "Pickup 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},





-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    ["check2"] = {"misstrevor3", "bike_chat_b_loop_1", "Check 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["carsleep"] = {"mp_cp_stolen_tut", "dazed", "Slep In Car", AnimationOptions =  
    {  
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["cheer2"] = {"mini@triathlon", "male_one_handed_a", "Cheer 2", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["cheer3"] = {"mini@triathlon", "male_two_handed_a", "Cheer 3", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["clean5"] = {"switch@franklin@cleaning_car", "001946_01_gc_fras_v2_ig_5_base", "Clean 5", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["clean3"] = {"timetable@floyd@clean_kitchen@idle_a", "idle_a", "Clean 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
        
    }},

    ["clean4"] = {"timetable@floyd@clean_kitchen@base", "base", "Clean 4", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        ----ExitEmote = "offchair",
        --ExitEmoteType = "Exits",
        
    }},
    ["cleanleg"] = {"mini@strip_club@backroom@", "stripper_c_leadin_backroom_idle_a", "Clean Legs", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 6000,
    }},
    ["crawl3"] = {"missheist_agency3aig_19", "ground_call_help", "Crawl 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["crawl2"] = {"missheist_agency3aig_19", "ground_call_help", "Crawl 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["crossarms8"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Crossarms 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["crossarms7"] = {"random@shop_gunstore", "_idle", "Crossarms 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["crouch2"] = {"combat@chg_stance", "crouch", "Crouch 2", AnimationOptions =  
    {  
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["crouch"] = {"missheistdockssetup1ig_10@base", "talk_pipe_base_worker1", "Crouch", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["cry"] = {"missfinale_a_ig_2", "trevor_death_reaction_pt", "Cry", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["dab2"] = {"penguin@dab1", "penguin_dab1", "Dab", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["drink2"] = {"friends@frl@ig_1", "drink_lamar", "Drink 2", AnimationOptions =
    {    
        Prop = 'prop_beer_patriot',
        PropBone = 60309,
        PropPlacement = {-0.03499999, -0.165, -0.015, 436.7987, 412.3998, 177.4},
        EmoteLoop = false,
        EmoteMoving = true,
    }},
    ["drunk"] = {"missbigscore1leadinoutbs_1_int", "leadin_loop_c_trevor", "Drunk", AnimationOptions =
    {   
        Prop = 'prop_wine_rose',
        PropBone = 58867,
        PropPlacement = {0.02499996, -0.009999998, -0.3599998, 172.9002, 183.6, 155.3},
        EmoteLoop = true,
        EmoteMoving = false, 
    }},
    ["drunk4"] = {"missheistpaletopinned", "pinned_against_wall_pro_loop_buddy", "Drunk 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["drunk2"] = {"timetable@tracy@ig_7@base", "base", "Drunk 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["verydrunk"] = {"timetable@tracy@ig_7@idle_a", "idle_a", "Very Drunk", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["drunk3"] = {"timetable@tracy@ig_7@idle_a", "idle_b", "Drunk 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["fear"] = {"anim@heists@ornate_bank@hostages@cashier_b@", "flinch_loop_underfire", "Fear", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["fear2"] = {"anim@heists@prison_heistunfinished_biz@popov_react", "popov_flinch_a", "Fear 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["fear3"] = {"anim@heists@prison_heistunfinished_biz@popov_react", "popov_flinch_b", "Fear 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["fear4"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_c", "Fear 4", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["fear5"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_d", "Fear 5", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["freezing"] = {"misschinese1leadinoutchi_1_mcs_4", "chi_1_mcs_4_tao_idle_2", "Freezing", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["pose1"] = {"custom@female_pose_1", "female_pose_1", "Female Pose 1", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["pose2"] = {"custom@female_pose_2", "female_pose_2", "Female Pose 2", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["pose3"] = {"custom@female_pose_3", "female_pose_3", "Female Pose 3", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["pose4"] = {"custom@male_pose_1", "male_pose_1", "Female Pose 4", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["pose5"] = {"custom@male_pose_2", "male_pose_2", "Female Pose 5", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["pose6"] = {"custom@male_pose_3", "male_pose_3", "Female Pose 6", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["p4"] = {"mpcas_int-2", "s_m_y_casino_01^1_dual-2", "Pose 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["fspose4"] = {"misscarsteal2pimpsex", "shagloop_hooker", "F Sex Pose 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["mspose"] = {"misscarsteal2pimpsex", "shagloop_pimp", "M Sex Pose", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["fspose5"] = {"rcmpaparazzo_2", "shag_action_poppy", "F Sex Pose 5", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["mspose2"] = {"rcmpaparazzo_2", "shag_action_a", "M Sex Pose 2", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},
    ["yoga2"] = {"missfam5_yoga", "c5_pose", "Yoga 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["yoga3"] = {"missfam5_yoga", "c6_pose", "Yoga 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["yoga4"] = {"missfam5_yoga", "c7_pose", "Yoga 4", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["yoga5"] = {"misslamar1leadinout", "yoga_02_idle_b", " Yoga 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["p1"] = {"missfbi4leadinoutfbi_4_int", "agents_idle_a_andreas", "Pose 1", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["p2"] = {"misshair_shop@barbers", "keeper_base", "Pose 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["p3"] = {"misshair_shop@hair_dressers", "keeper_idle_a", "Pose 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["p4"] = {"penguin@head", "penguinhead", " Pose 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p5"] = {"penguin@love", "penguinlove", " Pose 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p6"] = {"penguin@standpickpocket", "penguin_standpickpocket", " Pose 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p7"] = {"penguin@2fingers_up", "penguin_2_fingers_up", " Pose 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p8"] = {"penguin@pokcheek", "penguin_pok_cheek", " Pose 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p9"] = {"penguin@hold_the_cheek", "penguin_hold_the_cheek", " Pose 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p10"] = {"penguin@pose", "penguin_pose", " Pose 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["p11"] = {"penguin@pose2", "penguin_pose2", " Pose 11", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["p12"] = {"penguin@pose3", "penguin_pose3", " Pose 12", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["p13"] = {"penguin@pose4", "penguin_pose4", " Pose 13", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["p14"] = {"penguin@pose5", "penguin_pose5", " Pose 14", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["p15"] = {"penguin@pose6", "penguin_pose6", " Pose 15", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["p16"] = {"penguin@pose7", "penguin_pose7", " Pose 16", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p17"] = {"penguin@pose8", "penguin_pose8", " Pose 17", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p18"] = {"penguin@pose9", "penguin_pose9", " Pose 18", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["p19"] = {"penguin@pose10", "penguin_pose10", " Pose 19", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p20"] = {"penguin@dab", "penguin_dab", " Pose 20", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["guard2"] = {"misscarsteal2pimpsex", "pimpsex_pimp", "Guard & Aim", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},
    ["guardaim"] = {"guard_reactions", "1hand_aiming_cycle", "Guard Aim", AnimationOptions =
    {
       EmoteLoop = true
    }},
    ["heartbroken"] = {"anim@heists@prison_heistig_5_p1_rashkovsky_idle", "idle", "Heart Broken", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["incar"] = {"mini@prostitutes@sexnorm_veh", "bj_loop_male", "Sex in Car", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
    }},
    
    ["incar2"] = {"mini@prostitutes@sexnorm_veh", "bj_loop_prostitute", "Sex in Car 2", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},
    ["incar3"] = {"mini@prostitutes@sexlow_veh", "low_car_sex_loop_female", "Sex in Car 3", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},
    ["parody"] = {"anim@mp_player_intupperthumb_on_ears", "idle_a", "Parody", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["parody2"] = {"anim@mp_player_intincarthumb_on_earsstd@ps@", "idle_a", "Parody 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["parody3"] = {"anim@mp_player_intincarfreakoutstd@rps@", "idle_a", "Parody 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["parody4"] = {"anim@mp_player_intcelebrationmale@thumb_on_ears", "thumb_on_ears", "Parody 4", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["parody5"] = {"anim@mp_player_intcelebrationfemale@thumb_on_ears", "thumb_on_ears", "Parody 5", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},

    ["nosepick2"] = {"anim@mp_player_intincarnose_pickstd@ps@", "exit", "Nose Pick 2", AnimationOptions =
    {   
        EmoteLoop = false,
        EmoteMoving = true,
        
    }},
    ["parody6"] = {"anim@mp_player_intincardockbodhi@rds@", "idle_a_fp", "Parody 6", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["incite"] = {"fos_ep_1_p5-1", "csb_anita_dual-1", "Incite", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["masturbate"] = {"switch@trevor@jerking_off", "trev_jerking_off_exit", "Masturbate", AnimationOptions =
    {   
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},
    ["masturbate2"] = {"switch@trevor@jerking_off", "trev_jerking_off_loop", "Masturbate 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["surrender7"] = {"anim@move_hostages@male", "male_idle_to_cower", "Surrender 7", AnimationOptions =
    {   
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},
    ["sitmassage"] = {"missheistdocks2aleadinoutlsdh_2a_int", "massage_loop_2_floyd", "Sit Massage", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["massage"] = {"missheistdocks2aleadinoutlsdh_2a_int", "massage_loop_2_trevor", "Massage", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["massage2"] = {"missheistdocks2aleadinoutlsdh_2a_int", "massage_loop_floyd", "Massage 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["massage3"] = {"missheistdocks2bleadinoutlsdh_2b_int", "leg_massage_b_floyd", "Massage 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["massage4"] = {"missheistdocks2bleadinoutlsdh_2b_int", "leg_massage_floyd", "Massage 4", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["jpbox"] = {"mp_am_hold_up", "purchase_beerbox_shopkeeper", "Purchase Box", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 2500,
    }},
    ["jch"] = {"amb@code_human_police_investigate@idle_b", "idle_f", "Cop Search", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 7000,
    }},
    ["jgangsign5"] = {"anim@mp_player_intupperdock", "idle_a", "Gang Sign", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2500,
    }},
    ["jcheckwatch"] = {"amb@code_human_wander_idles_fat@male@idle_a", "idle_a_wristwatch", "Check Watch · Male", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteDuration = 5000,
    }},
    ["jgangaim"] = {"combat@aim_variations@1h@gang", "aim_variation_b", "Gang Aim", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteLoop = true
    }},
    ["uproar"] = {"divined@rpack@new", "uproar", "Uproar", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["mindblown"] = {"divined@rpack@new", "mindblown", "Mindblown", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["hailcab"] = {"divined@rpack@new", "hailcab", "Hailcab", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["kepler"] = {"divined@rpack@new", "kepler", "King Of The Jungle", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["deskchan"] = {"custom@deskchan", "deskchan", "Deskchan", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["dcry"] = {"divined@rpack@new", "dcry", "Cry 2", AnimationOptions =
    {
        EmoteLoop = true
    }},

       ["callme"] = {"divined@rpack@new", "callme", "Call Me", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["coronet"] = {"divined@rpack@new", "coronet", "Coronet", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["burpee"] = {"divined@rpack@new", "burpee", "Burpee", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["Heart"] = {"divined@rpack@new", "alchemy", "Heart", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["badmood"] = {"divined@rpack@new", "badmood", "Bad Mood", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["stop"] = {"anim@amb@casino@peds@", "mini_strip_club_idles_bouncer_stop_stop", "Stop", AnimationOptions =
    {
        EmoteMoving = true,
    }},
    
    ["jstandingf"] = {"anim@amb@casino@hangout@ped_female@stand@02a@base", "base", "Standing · Female ", AnimationOptions =
    {
        EmoteLoop = true,
    }},

    ["jstandingm"] = {"anim@amb@casino@hangout@ped_male@stand@03b@base", "base", "Standing · Male ", AnimationOptions =
    {
        EmoteLoop = true,
    }},

    ["pluck"] = {"custom@pluck_fruits", "pluck_fruits", "Pluck Fruits", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["backflip"] = {"custom@backflip", "backflip", "Backflip", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["convulsion"] = {"custom@convulsion", "convulsion", "Convulsion", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["waiter"] = {"custom@waiter", "waiter", "Waiter", AnimationOptions =
    {
    EmoteMoving = true,
    EmoteLoop = true,
    }},
    ["narutorun"] = {"custom@narutorun", "narutorun", "Naruto Run", AnimationOptions =
    {
    EmoteMoving = true,
    EmoteLoop = true,
    }},
    ["jumpingjack"] = {"custom@jumpingjack", "jumpingjack", "Militar Jumping Jacks", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["dragonballz"] = {"custom@dragonballz", "dragonballz", "Dragonball Z", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = false,
    }},
    ["deskchan"] = {"custom@deskchan", "deskchan", "Deskchan", AnimationOptions =
    {
    EmoteMoving = false,
    EmoteLoop = true,
    }},
    ["mgangsign_1"] = {"mikey@gangsigns@new", "mgangsign_1", "Gangsign 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mgangsign_2"] = {"mikey@gangsigns@new", "mgangsign_2", "Gangsign 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mgangsign_3"] = {"mikey@gangsigns@new", "mgangsign_3", "Gangsign 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mgangsign_4"] = {"mikey@gangsigns@new", "mgangsign_4", "Gangsign 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mgangsign_5"] = {"mikey@gangsigns@new", "mgangsign_5", "Gangsign 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mgangsign_6"] = {"mikey@gangsigns@new", "mgangsign_6", "Gangsign 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mgangsign_7"] = {"mikey@gangsigns@new", "mgangsign_7", "Gangsign 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mgangsign_8"] = {"mikey@gangsigns@new", "mgangsign_8", "Gangsign 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mgangsign_9"] = {"mikey@gangsigns@new", "mgangsign_9", "Gangsign 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mgangsign_10"] = {"mikey@gangsigns@new", "mgangsign_10", "Gangsign 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mgangsign_11"] = {"mikey@gangsigns@new", "mgangsign_11", "Gangsign 11", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jweeding"] = {"anim@amb@drug_field_workers@weeding@male_a@base", "base", "Weeding · Male ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dj15"] = {"anim@scripted@nightclub@dj@dj_moodm@", "moodm_cdj_left_a_12", "DJ 15", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["lfh"] = {"oddjobs@assassinate@old_lady", "looking_for_help", "Looking For Help", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
    ["tsomething"] = {"oddjobs@bailbond_hobohang_out_street_c", "idle_c", "Tell Something", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["waitt"] = {"oddjobs@taxi@", "idle_a", "Wait Taxi", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["noway2"] = {"oddjobs@towingpleadingbase", "base", "No Way 2", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jogger"] = {"move_f@jogger", "idle", "Jogger · Female", AnimationOptions =
   {
       EmoteDuration = 2500,
       EmoteMoving = true,
   }},
   ["jogger2"] = {"move_m@jogger", "idle", "Jogger · Male", AnimationOptions =
   {
       EmoteDuration = 2500,
       EmoteMoving = true,
   }},
   ["valet5"] = {"anim@amb@world_human_valet@formal_right@base@", "base_a_m_y_vinewood_01", "Valet 5", AnimationOptions =
   {
    EmoteMoving = true,
    EmoteLoop = true,
   }},
   ["valet4"] = {"anim@amb@world_human_valet@normal@base@", "base_a_m_y_vinewood_01", "Valet 4", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["listenmusic"] = {"anim@amb@carmeet@listen_music@male_a@trans", "a_trans_d", "Listen Music", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["checkout"] = {"anim@amb@carmeet@checkout_car@female_d@base", "base", "Check Out 3 · Female", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leancar"] = {"anim@scripted@carmeet@tun_meet_ig2_race@", "base", "Lean Car", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["check"] = {"misstvrram_5", "marines_idle_b", "Check", AnimationOptions =
   {   
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["handsup4"] = {"mp_defend_base", "guard_handsup_loop", "Hands Up 4", AnimationOptions =  
   {  
   EmoteMoving = false,
    EmoteLoop = true,
   }},



}
CustomDP.PropEmotes = {

    ["jleaningwallback"] = {"anim@amb@casino@peds@", "amb_world_human_leaning_male_wall_back_mobile_idle_a", "Leaning Wall Back · Male", AnimationOptions =
    {
     Prop = "prop_npc_phone_02",
     PropBone = 28422,
     PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
     EmoteLoop = true,
     EmoteMoving = true,
    }},

    ["jdgrave"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Digging Grave ", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Prop = 'prop_tool_shovel006',
        PropBone = 28422,
        PropPlacement = {0.0, 0.1, -0.6, 0.0, 0.0, 180.0},
    }},

    ["jreadmessages2"] = {"anim@amb@carmeet@take_photos@female_b@base", "base", "Read Messages 2 · Female ", AnimationOptions =
    {
        EmoteMoving = false,  
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
    }},
 
    ["jreadmessages"] = {"anim@amb@carmeet@take_photos@male_a@base", "base", "Read Messages · Male ", AnimationOptions =
    {
        EmoteMoving = false,
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
    }},

}

-----------------------------------------------------------------------------------------
--| I don't think you should change the code below unless you know what you are doing |--
-----------------------------------------------------------------------------------------

-- Add the custom emotes to RPEmotes main array
for arrayName, array in pairs(CustomDP) do
    if RP[arrayName] then
        for emoteName, emoteData in pairs(array) do
            RP[arrayName][emoteName] = emoteData
        end
    end
    -- Free memory
    CustomDP[arrayName] = nil
end
-- Free memory
CustomDP = nil



