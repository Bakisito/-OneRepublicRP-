local Translations = {
    targetlabels = {
        rent_vehicle = 'Rent Vehicle',
        view_rentals = 'View Rentals'
    },
    progress = {
        preparing = 'Preparing'
    },
    info = {
        available_vehicle = 'Available Vehicles',
        current_rentals = 'Current Rentals',
        return_vehicle = 'Return Vehicle',
        vehicle_plate = 'Plate',
        vehicle_fuel = 'Fuel',
        vehicle_location = 'Parked',
        vehicle_price = 'Price',
        payment_method = 'Payment Method',
        payment_cash = 'Cash',
        payment_bank = 'Bank',
        time_for_rental = 'Time in hours for rental',
        money_received = 'You recieved some money back %{money}'
    },
    error = {
        no_payment_method = 'No selected payment method..',
        above_rental_limit = 'That is above the rental limit..',
        no_rental_time = 'No selected rent time..',
        not_the_right_vehicle = 'This isn\'t the right vehicle..',
        no_vehicle_nearby = 'There isn\'t a vehicle nearby..',
        insufficent_funds = 'You do not have enough money..'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
