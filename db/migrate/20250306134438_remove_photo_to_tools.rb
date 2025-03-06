class RemovePhotoToTools < ActiveRecord::Migration[7.1]
  def change
    remove_column :tools, :photo
  end
end
