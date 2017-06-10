class AmenitiesController < ApplicationController
  def index
    @amenities = [
      {
        name: 'Internet',
        icon: 'wifi',
        description: ['Wifi is available in all areas and is free of charge']
      },
      { 
        name: 'Parking',
        icon: 'car',
        description: [ 'Public parking is available at a location nearby (reservation is not needed) and charges may apply.']
      },
      { 
        name: 'Pets',
        icon: 'paw',
        description: [ 'Pets are not allowed']
      },
      { 
        name: 'Food & Drink',
        icon: 'cutlery',
        description: [ 'Restaurant', 'Room service', 'Breakfast in the room']
      },
      { 
        name: 'Family Friendly',
        icon: 'home',
        description: [ 'Family rooms']
      },
      { 
        name: 'General',
        icon: 'info-circle',
        description: [ 'Non-smoking rooms', 'Air conditioning']
      },
      { 
        name: 'Transportation',
        icon: 'bus',
        description: [ 'Airport shuttle', 'Airport shuttle (surcharge)', 'Bicycle rental']
      },
      { 
        name: 'Front Desk Services',
        icon: 'shield',
        description: [ '24-hour front desk', 'Concierge service', 'Tour desk', 'Ticket service', 'Currency exchange', 'Luggage storage', 'Safety deposit box']
      },

      { 
        name: 'Business Facilities',
        icon: 'briefcase',
        description: ['Business center']
      },
      { 
        name: 'Cleaning Services',
        icon: 'trash-o',
        description: ['Daily maid service', 'Laundry', 'Ironing service']
      },
    ]

  end
end
