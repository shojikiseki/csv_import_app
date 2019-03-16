class ImportCsv < ApplicationRecord
  def self.import(path)
    # ユーザー情報を格納するための配列を用意
    user_list = []
    CSV.foreach(path, headers: true) do |row|
      # CSVファイルのデータをuser_listに格納
      user_list << {
        name: row['name'],
        age: row['age'],
        height: row['height'],
        weight: row['weight']
      }
    end

    puts 'インポート処理開始'
    # 例外処理対応
    begin
      # user_listに格納したデータで一気に保存
      User.create!(user_list)
      puts 'インポート完了'
    rescue => e
      puts 'インポートに失敗しました。以下のエラーを確認してください'
      puts e
    end
  end
end
