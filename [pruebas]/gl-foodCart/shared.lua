Config = {}

Config.RentalPrice = 500

Config.FoodCarts = {

{cartName = 'Burger Stand', job = 'all' --[[ This will only allow people with burgershot to work the stand ]], cartModel = 'prop_burgerstand_01', propX =-0.2, propY =-1.8, propZ =-0.4},
{cartName = 'Hotdog Stand', job = 'all' --[[ This will allow ANYONE to work the stand ]], cartModel = 'prop_hotdogstand_01', propX =-0.2, propY =-1.5, propZ =-0.4},

}

Config.Foods = {
['Burger Stand'] = {
	Items = {
		['Chimi'] = {itemName = 'burgerr', animation = 'PROP_HUMAN_BBQ'--[[Only using Scenarios atm]], cookTime = 5000 --[[ Cook Time in Miliseconds (3000 = 3 Seconds)]] },
		['Hamburger'] = {itemName = 'burger', animation = 'PROP_HUMAN_BBQ'--[[Only using Scenarios atm]], cookTime = 10000 --[[ Cook Time in Miliseconds (10000 = 10 Seconds)]]},
		['Dave`s Double'] = {itemName = 'burger2', animation = 'PROP_HUMAN_BBQ'--[[Only using Scenarios atm]], cookTime = 10000 --[[ Cook Time in Miliseconds (10000 = 10 Seconds)]]},
		['Burrito de Res'] = {itemName = 'burrito1', animation = 'PROP_HUMAN_BBQ'--[[Only using Scenarios atm]], cookTime = 10000 --[[ Cook Time in Miliseconds (10000 = 10 Seconds)]]},
		['Fries'] = {itemName = 'fries', animation = 'PROP_HUMAN_BBQ'--[[Only using Scenarios atm]], cookTime = 4000 --[[ Cook Time in Miliseconds (4000 = 4 Seconds)]]},
		['Coca-Cola'] = {itemName = 'coke_1', animationType = 'other' --[[ scenario if using scenario, other if not using scenario ]], animDict = 'anim@mp_player_intupperspray_champagne'--[[Animation Dictionary used]],animation = 'idle_a'--[[Only using Scenarios atm]], cookTime = 4000 --[[ Cook Time in Miliseconds (4000 = 4 Seconds)]]},
		['7Up'] = {itemName = '7up_1', animationType = 'other' --[[ scenario if using scenario, other if not using scenario ]], animDict = 'anim@mp_player_intupperspray_champagne'--[[Animation Dictionary used]],animation = 'idle_a'--[[Only using Scenarios atm]], cookTime = 4000 --[[ Cook Time in Miliseconds (4000 = 4 Seconds)]]},

	}

},
['Hotdog Stand'] = {
	Items = {
		['Hotdog'] = {itemName = 'hotdog', animation = 'PROP_HUMAN_BBQ'--[[Only using Scenarios atm]], cookTime = 4000 --[[ Cook Time in Miliseconds (4000 = 4 Seconds)]]},
		['Burrito de Pollo'] = {itemName = 'burrito2', animation = 'PROP_HUMAN_BBQ'--[[Only using Scenarios atm]], cookTime = 10000 --[[ Cook Time in Miliseconds (10000 = 10 Seconds)]]},
		['Taco'] = {itemName = 'taco', animation = 'PROP_HUMAN_BBQ'--[[Only using Scenarios atm]], cookTime = 10000 --[[ Cook Time in Miliseconds (10000 = 10 Seconds)]]},
		['Fries'] = {itemName = 'fries', animation = 'PROP_HUMAN_BBQ'--[[Only using Scenarios atm]], cookTime = 4000 --[[ Cook Time in Miliseconds (4000 = 4 Seconds)]]},
		['Coca-Cola'] = {itemName = 'coke_1', animationType = 'other' --[[ scenario if using scenario, other if not using scenario ]], animDict = 'anim@mp_player_intupperspray_champagne'--[[Animation Dictionary used]],animation = 'idle_a'--[[Only using Scenarios atm]], cookTime = 4000 --[[ Cook Time in Miliseconds (4000 = 4 Seconds)]]},
		['7Up'] = {itemName = '7up_1', animationType = 'other' --[[ scenario if using scenario, other if not using scenario ]], animDict = 'anim@mp_player_intupperspray_champagne'--[[Animation Dictionary used]],animation = 'idle_a'--[[Only using Scenarios atm]], cookTime = 4000 --[[ Cook Time in Miliseconds (4000 = 4 Seconds)]]},
	}
},


}