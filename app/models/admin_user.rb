class AdminUser < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # def roles= ids
  #   global_roles = Role.global
  #   global_ids = global_roles.collect { |r| r.id }

  #   exists_ids = self.roles.collect { |r| r.id }

  #   exists_ids.each do | id |
  #       name = Role.find(id).name
  #       unless ids.include? exists_ids
  #           self.remove_role name
  #       end
  #   end

  #   ids.each do |id|
  #       name = Role.find(id).name
  #       if global_ids.include? id
  #           self.add_role name
  #       end
  #   end
  # end
end
