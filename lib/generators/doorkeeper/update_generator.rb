require 'rails/generators/active_record'

class Doorkeeper::UpdateGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)
  desc "Updates Doorkeeper."

  def update
    migration_template 'update.rb', 'db/migrate/update_doorkeeper_tables.rb'
  end

  def self.next_migration_number(dirname)
    ActiveRecord::Generators::Base.next_migration_number(dirname)
  end

end
