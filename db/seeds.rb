# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  name: "hina",
  email: "hina@g",
  password: "aiueo1031"
)

Tag.create([
    { name: '春' },
    { name: '夏' },
    { name: '秋' },
    { name: '冬' },
    { name: '葉菜類' },
    { name: '根菜類' },
    { name: '果菜類' },
    { name: '甘味' },
    { name: '苦味' },
    { name: '辛味' },
    { name: '酸味' },
    { name: 'みずみずしい' },
    { name: 'ほくほく' },
    { name: 'シャキシャキ' },
    { name: 'にんじん' },
    { name: '大根' },
    { name: 'ほうれん草' },
    { name: '小松菜' },
    { name: 'ごぼう' },
    { name: 'キャベツ' },
    { name: 'レタス' },
    { name: 'ブロッコリー' },
    { name: '白菜' },
    { name: '水菜' },
    { name: 'かぼちゃ' },
    { name: 'じゃがいも' },
    { name: '里芋' },
    { name: 'ピーマン' },
    { name: 'ニラ' },
    { name: 'トマト' },
    { name: 'なす' },
    { name: 'オクラ' },
    { name: 'ねぎ' },
    { name: '玉ねぎ' },
    { name: 'レンコン' },
    { name: 'きゅうり' },
    { name: 'ミニトマト' },
    { name: '春菊' },
    { name: '菜花' },
    { name: 'カブ' },
    { name: 'サツマイモ' },
    { name: 'セロリ' },
  ])

