# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@group_one = Group.create(name: "Holiday", user_id: 1)
@group_two = Group.create(name: "dinner", user_id: 1)
@group_three = Group.create(name: "Groceries", user_id: 1)

@entity_one = Entity.create(name: "macDonalds", amount: 20, user_id: 1)
@entity_two = Entity.create(name: "KFC", amount: 20, user_id: 1)


GroupEntity.create(entity_id: @entity_one.id, group_id: @group_one.id)
GroupEntity.create(entity_id: @entity_two.id, group_id: @group_one.id)