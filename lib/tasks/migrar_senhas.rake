#encoding: utf-8
namespace :app do
  desc "Encripta todas as senhas que \
        que ainda não foram processadas no banco"

  task migrar_senhas: :environment do
    unless User.attribute_names.include? "password"
      puts "As senhas foram migradas!"
      return
    end

    User.find_each do |user|

      puts "Migrando usuário #{user.id} #{user.full_name}"
      if user.valid? || user.attributes["password"].blank?
        puts "Usuário inválido #{user.id} #{user.full_name}"
        next
      end

      unecripted_password = user.attributes["password"]
      user.password = unecripted_password
      user.password_confirmation = unecripted_password
      user.save!
    end

  end
end
