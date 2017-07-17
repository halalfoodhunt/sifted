class AddAttachmentMediaUploadToMedia < ActiveRecord::Migration
  def self.up
    change_table :media do |t|
      t.attachment :media_upload
    end
  end

  def self.down
    remove_attachment :media, :media_upload
  end
end
