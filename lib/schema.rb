require_relative 'test_environment'

class CreateTables < ActiveRecord::Migration[5.0]

  def up
    create_table :weapons do |t|
      t.string :name
      t.string :kind
    end

    create_table :victims do |t|
      t.string :name
      t.belongs_to :weapon, :foreign_key => 'weapons.id'
    end
  end

  def down
    drop_table :weapons
    drop_table :victims
  end

end

def main
  action = (ARGV[0] || :up).to_sym

  CreateTables.migrate(action)
end

main if __FILE__ == $PROGRAM_NAME
