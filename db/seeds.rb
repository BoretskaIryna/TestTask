# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Iryna Boretska",
             email: "boretskairuna@gmail.com",
             password:              "asdzxc",
             password_confirmation: "asdzxc",
             project_manager: true,
             confirmed_at: Time.zone.now)

User.create!(name:  "Example Customer",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             project_manager: false,
             confirmed_at: Time.zone.now)

User.create!(name:  "Example PM",
             email: "foo@bar.com",
             password:              "foobar",
             password_confirmation: "foobar",
             project_manager: true,
             confirmed_at: Time.zone.now)

User.create!(name:  "Example1 Customer1",
             email: "example1@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             project_manager: false,
             confirmed_at: Time.zone.now)

User.create!(name:  "Iryna Boretska",
             email: "boretskairuna23@gmail.com",
             password:              "asdzxc",
             password_confirmation: "asdzxc",
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
               collaborator_id:2)
Member.create!(team_id: 1,
               collaborator_id:4)
