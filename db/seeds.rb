# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

yeet = User.find(1)

Record.create(user: yeet, time: 300000)
Record.create(user: yeet, time: 350000)
Record.create(user: yeet, time: 200000)
Record.create(user: yeet, time: 250000)
Record.create(user: yeet, time: 300500)
