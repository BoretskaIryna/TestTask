# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Example PM1",
             email: "example_pm1@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             project_manager: true,
             confirmed_at: Time.zone.now)

User.create!(name:  "Example Collaborator1",
             email: "example_coll1@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             project_manager: false,
             confirmed_at: Time.zone.now)

User.create!(name:  "Example PM2",
             email: "example_pm2@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             project_manager: true,
             confirmed_at: Time.zone.now)

User.create!(name:  "Example1 Collaborator2",
             email: "example_coll2@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             project_manager: false,
             confirmed_at: Time.zone.now)

User.create!(name:  "Example1 Collaborator3",
             email: "example_coll3@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             project_manager: false,
             confirmed_at: Time.zone.now)


Task.create!(name: "Primo",
             type_task: "code",
             status: "done",
             pm_id: 1,
             collaborator_id: 2)

Task.create!(name: "Secondo",
             type_task: "bug fix",
             status: "in progress",
             pm_id: 1,
             collaborator_id: 2)

Task.create!(name: "Terzo",
             type_task: "test",
             status: "open",
             pm_id: 3,
             collaborator_id: 2)

Task.create!(name: "Quarto",
             type_task: "code",
             status: "open",
             pm_id: 3,
             collaborator_id: 4)


Team.create!(name: "First",
             leader_id: 1)
Team.create!(name: "First1",
             leader_id: 1)
Team.create!(name: "Second",
             leader_id: 3)


Member.create!(team_id: 1,
               collaborator_id:2,
               activated: true,
               activated_at: Time.zone.now)
Member.create!(team_id: 1,
               collaborator_id:4,
               activated: true,
               activated_at: Time.zone.now)
Member.create!(team_id: 1,
               collaborator_id:5,
               activated: false,
               activated_at: Time.zone.now)
