# frozen_string_literal: true
# == Schema Information
#
# Table name: channels
#
#  id                                                  :bigint(8)        not null, primary key
#  comment_count(チャンネルのコメント数)                          :integer
#  description(チャンネルの説明)                               :string(255)
#  hidden_subscriber_count(チャンネル登録者数を公開表示するかどうかを指定します) :boolean
#  published_at(チャンネルの開設日)                             :datetime
#  subscriber_count(チャンネルの登録者数)                        :integer
#  title(チャンネルのタイトル)                                   :string(255)
#  view_count(チャンネルの再生回数)                              :integer
#  created_at                                          :datetime         not null
#  updated_at                                          :datetime         not null
#  channel_id(チャンネルID)                                 :string(255)
#  etag_id(etag ID)                                    :string(255)
#

FactoryBot.define do
  factory :channel do
  end
end