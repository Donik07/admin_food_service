# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

begin
  puts "Creating account..."
  account = Account.create(company_name: "ООО Теремок",
                           inn: "93849139248",
                           email: "teremok@gmail.com",
                           phone: "+79852817775",
                           country: "Russia",
                           city: "Moscow",
                           is_partner: false
  )
  raise StandardError if account.blank?
  puts "Account created!"

  puts "Creating point..."
  point = Point.create(name: "Теремок №1",
                       address: "ул. Прокопьева, д.31",
                       account_id: account.id
  )
  raise StandardError if point.blank?
  puts "Point created!"

  puts "Creating users..."
  user = User.create(first_name: "Михаил",
                     last_name: "Герасимов",
                     email: "gerasimovM@gmail.com",
                     phone: "+79841234433",
                     point_id: point.id,
                     account_id: account.id
  )
  raise StandardError if user.blank?

  user = User.create(first_name: "Анна",
                     last_name: "Федотова",
                     email: "fedotovaA@gmail.com",
                     phone: "+79841231233",
                     point_id: point.id,
                     account_id: account.id
  )
  raise StandardError if user.blank?
  puts "Users created!"

  puts "Creating order stages..."
  OrderStage.create(name: "Новый заказ",
                    color: "gray",
                    position: "1",
                    point_id: point.id
  )

  OrderStage.create(name: "Готовим",
                    color: "yellow",
                    position: "2",
                    point_id: point.id
  )

  OrderStage.create(name: "Заказ готов",
                    color: "green",
                    position: "3",
                    point_id: point.id
  )
  puts "Order stages created!"
end
