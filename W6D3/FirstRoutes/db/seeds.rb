# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

john = User.create!({ username: 'John' })
zeke = User.create!({ username: 'Zeke' })
jack = User.create!({ username: 'Jack' })

ducky = Artwork.create!({title: 'Rubber Ducky', image_url: 'duckies4lyfe.com/rubberducky', artist_id: john.id})
bunny = Artwork.create!({title: 'Rubber Bunny', image_url: 'bunnies4lyfe.com/rubberbunny', artist_id: zeke.id})
chicken = Artwork.create!({title: 'Rubber Chicken', image_url: 'chickens4lyfe.com/rubberchicken', artist_id: jack.id})

share1 = ArtworkShare.create!({artwork_id: ducky.id, viewer_id: zeke.id})
share2 = ArtworkShare.create!({artwork_id: bunny.id, viewer_id: jack.id})
share3 = ArtworkShare.create!({artwork_id: chicken.id, viewer_id: john.id})

comment1 = Comment.create!({ user_id: john.id, artwork_id: chicken.id, body: 'Mmm chicken nuggets' })
comment2 = Comment.create!({ user_id: zeke.id, artwork_id: ducky.id, body: 'Mmm duck' })
comment3 = Comment.create!({ user_id: jack.id, artwork_id: bunny.id, body: 'Mmm bunny' })
