class AddGenreToBillboards < ActiveRecord::Migration[5.2]
  def change
    add_column :billboards, :genre, :string
  end
end
