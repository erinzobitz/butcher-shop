
animals = Animal.create([{ name: 'Cow'}, {name: 'Pig'}])

cow = Animal.find_by_name('Cow')
["Porterhouse", "T-Bone", "Strip"].each do |cut|
  cow.cuts.find_or_create_by_name(cut)	
end

["Chuck", "Short Loin", "Rib"].each do |primal_cut|
	cow.primal_cuts.find_or_create_by_name(primal_cut)
end

pig = Animal.find_by_name('Pig')
["Babyback Ribs", "Spareribs", "Hock"].each do |cut|
	pig.cuts.find_or_create_by_name(cut)	
end

["Jowl", "Ham", "Loin"].each do |primal_cut|
	pig.primal_cuts.find_or_create_by_name(primal_cut)
end

rib = cow.primal_cuts.find_by_name('Rib')
["Prime Rib", "Rib Eye"].each do |rib_cut|
	rib.cuts.find_or_create_by_name(rib_cut)
end

loin = pig.primal_cuts.find_by_name('Loin')
["Loin Chop", "Blade Roast"].each do |loin_cut|
	loin.cuts.find_or_create_by_name(loin_cut)
end

user =User.create(first_name: 'Erin', last_name: 'Zobitz', email: 'erinzobitz@gmail.com')

favorite_cut = Cut.find_by_name('Porterhouse')
user.cuts << favorite_cut

