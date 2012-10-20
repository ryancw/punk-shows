namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Show, User, Band].each(&:delete_all)
          
      Show.populate 100..150 do |show|
        show.acts = Populator.words(1..8).titleize
        show.user_id = 1
        show.details = Populator.sentences(2..25)
        show.location = Populator.words(1..4).titleize
        show.date = 2.years.ago..Time.now
        show.created_at = 2.years.ago..Time.now
      end
    
    
    User.populate 5 do |person|
      person.name    = Faker::Name.name
      person.email   = Faker::Internet.email
      person.created_at = 2.years.ago..Time.now
    end
  end
end