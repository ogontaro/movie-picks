# frozen_string_literal: true

class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :channel_id, comment: "チャンネルID", index: true, null: false
      t.string :etag_id, comment: "etag ID"
      t.string :title, comment: "チャンネルのタイトル"
      t.string :country, comment: "チャンネルの登録国"
      t.text :description, comment: "チャンネルの説明"
      t.datetime :published_at, comment: "チャンネルの開設日", index: true
      t.bigint :view_count, comment: "チャンネルの再生回数", index: true
      t.integer :comment_count, comment: "チャンネルのコメント数", index: true
      t.integer :subscriber_count, comment: "チャンネルの登録者数", index: true
      t.integer :video_count, comment: "チャンネルのビデオ数", index: true
      t.boolean :hidden_subscriber_count, comment: "チャンネル登録者数を公開表示するかどうかを指定します"

      t.timestamps
    end
  end
end
