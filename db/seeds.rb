# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.create([
  { name: '人気' },
  { name: 'マイナー' },
  { name: 'かっこいい' },
  { name: '落ち着いた' },
  { name: '明るい' },
  { name: '悲しい' },
  { name: 'ラブ' },
  { name: '失恋' },
  { name: 'ロック' },
  { name: 'ジャズ' },
  { name: 'アニメ' },
])