User.destroy_all
User.create( name: 'admin', email: 'admin@admin.com', password: 'admin123', password_confirmation: 'admin123', admin: true)
user_1 = User.create( name: 'Marco Montes', email: 'marcomontes@gmail.com', password: 'marcomontes', password_confirmation: 'marcomontes')
user_2 = User.create( name: 'Emilio Botero', email: 'emiliomontes@gmail.com', password: 'emiliomontes', password_confirmation: 'emiliomontes')
user_3 = User.create( name: 'Juan Perez', email: 'juanperez@gmail.com', password: 'juanperez', password_confirmation: 'juanperez')
user_4 = User.create( name: 'Pedro Botero', email: 'pedrobotero@gmail.com', password: 'pedrobotero', password_confirmation: 'pedrobotero')


Group.destroy_all
Group.create(name: "Grupo 1", user_ids: [user_1.id, user_2.id])
Group.create(name: "Grupo 2", user_ids: [user_1.id, user_3.id, user_4.id])

Category.destroy_all
Category.create(name: "Eventos")
Category.create(name: "Noticias")
