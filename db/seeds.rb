# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.find_by_email('admin@energyuniten.com')
if !admin.present?
    admin = Admin.create!(email: 'admin@energyuniten.com', password: '123qaz', password_confirmation: '123qaz')
end