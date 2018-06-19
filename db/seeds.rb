# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = Expert.create(email:"expert@yahoo.com", username: "expert", type: 'Expert', password: '123456')
ExpertDetail.create(service:"service", profession:"profession", expert: u1)
u2 = Novice.create(email:"novice@yahoo.com",username:"novice",type: 'Novice', password: '123456')
u3 = Novice.create(email:"guest@yahoo.com",username:"guest", type: 'Novice', password: '123456')
r1 = Role.create(name: "Expert")
r2 = Role.create(name: "Novice")
Assignment.create( user_id: u1.id,role_id: r1.id )
Assignment.create( user_id: u2.id,role_id: r2.id )
camp1 = Campaign.create(title: "campaign1", tags: "test", start_date: DateTime.parse("09/01/2009 17:00"), end_date: DateTime.parse("09/01/2009 18:00"),user_id: u1.id)
camp2 = Campaign.create(title: "campaign2", tags: "check", start_date: DateTime.parse("09/01/2009 18:00"), end_date: DateTime.parse("09/01/2009 19:00"), user_id: u1.id)
Todo.create(task: "task1", campaign_id: camp1.id, user_id: u1.id)
Todo.create(task: "task2", campaign_id: camp2.id, user_id: u2.id)
Comment.create(title: "it is a good campaign", commentable_id: camp1, commentable_type: Campaign, user_id: u1.id)
