class HoneywordsCreate < ActiveRecord::Migration
  def change
    create_table(:honeywords) do |t|
      t.integer :auth_id, :null => false
      t.string :encrypted_honeyword, :null => false
    end

    add_index :honeywords, :auth_id
  end
end


