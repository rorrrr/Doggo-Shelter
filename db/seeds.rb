require_relative( '../models/anaimal.rb' )
require_relative( '../models/owner.rb' )
require('pry')

Animal.delete_all
Owner.delete_all

animal1 = Animal.new({
  'name' => 'Lennon',
  'type' => 'Dog',
  'breed' => 'Boopershnoop Pupperdoop',
  'bio' => 'This is Lennon. He is a Boopershnoop Pupperdoop. Quite rare. Exceptionally pettable. would definitely boop that shnoop',
  'rating' => 12,
  'image' => 'lennon.jpg'})

animal1.save

animal2 = Animal.new({
  'name' => 'Alvin',
  'type' => 'Chipmunk',
  'breed' => 'Bangladeshi Couch',
  'bio' => 'This is Alvin, a Bangladeshi Couch Chipmunk. Heckin rare',
  'rating' => 13,
  'image' => 'alvin.jpg'
})

animal2.save

animal3 = Animal.new({
  'name' => "Penny",
  'type' => 'Dog',
  'breed' => 'Brown Retriever',
  'bio' => 'This is Penny. She fought a bee and the bee won. You are fine Penny, everything is fine. Would pet with painkillers',
  'rating' => 9,
  'image' => 'penny.jpg'
})

animal3.save

animal4 = Animal.new({
  'name' => 'Mak',
  'type' => 'Walrus',
  'breed' => 'Bangladeshi Couch',
  'bio' => 'This is Mak, a Taiwanese Guide Walrus. Im getting real heckin tired of his tusks. Would pet with caution',
  'rating' => 9,
  'image' => 'Mak.jpg'
})

animal4.save

animal5 = Animal.new({
  'name' => 'Doge',
  'type' => 'Dog',
  'breed' => 'Shiba',
  'bio' => 'This is doge, much cute. Many pets. Doing me quite a cuteness',
  'rating' => 14,
  'image' => 'Doge.jpg'
})

animal5.save

owner1 = Owner.new({
  'name' => 'Rory',
  'contact_number' => "07444976627",
  'ideal_type' => "Dog"
  })

owner1.save

owner2 = Owner.new({
  'name' => 'Amy',
  'contact_number' => "07221156777",
  'ideal_type' => "Walrus"
  })

owner2.save

owner3 = Owner.new({
  'name' => 'Amy',
  'contact_number' => "01234556777",
  'ideal_type' => "Cat"
  })

owner3.save

adoption1 = Adoption.new({
    'animal_id' => animal1.id,
    'owner_id' => owner1.id
  })

adoption1.save

adoption2 = Adoption.new({
    'animal_id' => animal2.id,
    'owner_id' => owner2.id
  })

adoption2.save




