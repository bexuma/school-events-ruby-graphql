# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all

User.create!(
  name: "NURBANK",
  email: "cc@nurbank.kz",
  username: "nurbank",
  password: "secret",
  password_confirmation: "secret"
)

Event.create!(
  title: "Благотворительный Музыкальный Забег",
  site_url: "http://nurrun.kz/",
  starts_at: DateTime.new(2018,8,4,7),
  ends_at: DateTime.new(2018,8,4,12,30),
  user_id: User.first.id,
  description: %Q{
    Забег проводится с целью:
    — благотворительности и привлечения внимания к проблеме онкологических заболеваний
    — популяризации бега
    — поддержки благотворительных проектов республиканского значения
    — отказа от вредных привычек (курения)
    — формирования здоровой нации

    Все средства, полученные со стартовых взносов на забеге, а также все взносы, полученные и от продажи товаров на ярмарке будут направлены в Научный центр педиатрии и детской хирургии г. Алматы.

    Регистрация на участие в забеге по ссылке
  },
  prices_attributes: [
    {
      label: "Музыкальный Забег: Дистанция 10 км",
      amount: 4000
    },
    {
      label: "Музыкальный Полумарафон: Дистанция 21 км",
      amount: 4000
    },
    {
      label: "Детский Забег: Дистанция 3 км",
      amount: 1000
    },
    {
      label: "Скандинавская ходьба: Дистанция 10 км",
      amount: 4000
    }
  ]
)

User.create!(
  name: "Арт-убежище Bunker",
  email: "info@bunker.kz",
  username: "bunkerkz",
  password: "secret",
  password_confirmation: "secret"
)

Event.create!(
  title: "Поэтический вечер «Строки»",
  site_url: "http://nurrun.kz/",
  starts_at: DateTime.new(2018,8,4,19),
  ends_at: DateTime.new(2018,8,4,22),
  user_id: User.last.id,
  description: %Q{
    Если вы устали от шумных тусовок, если вас привлекают творческие люди, интеллектуальные беседы, если вы неравнодушны к литературному искусству, то добро пожаловать! Авторские произведения, известные и не очень стихи, образные постановки от поэтов, перформансы от артистов театра и, конечно, новые знакомства.
  },
  prices_attributes: [
    {
      amount: 1500
    }
  ]
)