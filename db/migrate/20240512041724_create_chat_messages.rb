class CreateChatMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_messages do |t|
      t.references :chat_room, null: false, foreign_key: true
      t.string :role, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
