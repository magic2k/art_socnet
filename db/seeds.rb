# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


3.times do |i|
  i+=1

  usr = User.create!(
            firstname: "Test#{i}",
            lastname: 'Testovich',
    city: 'Tristram',
    country: 'Tamriel',
    skype: 'Aloha666',
    birthdate: '24-11-1990',
    phone: '(812)555-55-55',
    vkontakte: 'ololo.vk.com',
    odkl:     'leha-ujeban.odkl.ru',
    twitter:  'twitter.com/huitterr',
    admin:    'f',
    usr_type: 'showman',
    banned:   'f',
    completed: 't',
    about:    'Ololooooo trolooloooooo. Thats all.',
    email:    "dorkpork#{i}@morpork.com",
    # encrypted_password: '$2a$10$oAHfisCQao5937fNz2EHXOvPx/5sCpGPkDu7nzwKOyCEsow28jzzC',
    created_at: '2014-04-19 08:45:13.628063',
    updated_at: '2014-04-19 08:45:16.055981',
    # authentication_token: '7xdjzkk8y8fWm9ByA9-j',
    password: 'huiyoooooddd'
)

typ = ShowmanType.create!(user_id: i, bartender:true)

end
