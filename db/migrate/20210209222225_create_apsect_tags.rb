class CreateApsectTags < ActiveRecord::Migration[6.1]
  def change
    create_table :apsect_tags do |t|
      t.belongs_to :aspect, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
