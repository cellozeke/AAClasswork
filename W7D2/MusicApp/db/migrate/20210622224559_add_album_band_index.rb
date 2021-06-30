class AddAlbumBandIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :albums, :band_id
  end
end
