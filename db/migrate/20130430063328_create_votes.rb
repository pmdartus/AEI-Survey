class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :email
      t.boolean :validated
      t.string :tocken
      t.integer :choice

      t.timestamps
    end
  end
end
