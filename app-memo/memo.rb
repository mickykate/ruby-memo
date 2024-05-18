
require "csv" # CSVファイルを扱うためのライブラリを読み込む

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換

# if文で条件分岐していく

if memo_type == 1
    puts "拡張子を除いたファイルを入力してください。"
    file_name = gets.chomp #.chompで改行文字を除去できる！

    puts "メモしたい内容を入力してください"
    puts "入力後、Ctrl + Dを押します"

    memo = STDIN.readlines #STDINは標準入力のこと。(=foreachメソッド?)

    CSV.open("#{file_name}.csv","w") do |csv|
     csv << ["{#memo}"]
end

elsif memo_type == 2
    puts "拡張子を除いた既存のファイルを入力してください"
    file_name = gets.chomp

    puts "編集内容を入力してください"
    puts "終了後、Ctrl + Dを押します"

    memo = STDIN.readlines

    CSV.open("#{file_name}.csv","a") do |csv|
     csv << ["{#memo}"]
end

else    
    puts "入力が正しくありません。1 または 2 を選択してください。"
    puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"   
    memo_type = gets.to_i
end

