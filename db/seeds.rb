# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
seed_file = Rails.root.join('db', 'seeds.yml')
config = YAML::load_file(seed_file)
config=config.to_h
hash = ActiveSupport::HashWithIndifferentAccess.new(config)
hash[:project].each{|x|
projid=Project.create(title:x[:title])
x[:todos].each{|y|

hash_todo = ActiveSupport::HashWithIndifferentAccess.new({text:y[:text],project_id:projid.id,isCompleted:y[:isCompleted]})

todos=Todo.create(hash_todo)
}

}

