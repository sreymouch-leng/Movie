class AddFieldsToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :description, :string
    add_column :movies, :released_on, :datetime
  end
end
