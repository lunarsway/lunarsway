class RolesAddLunarnaut < ActiveRecord::Migration
  def self.up
    r = Role.new
    r.id = 2
    r.rolename = "lunarnaut"
    r.save
  end

  def self.down
    Role.find_by_rolename("lunarnaut").destroy
  end
end
