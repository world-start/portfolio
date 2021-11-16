# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: 'bbb@sample.com', password: '234567') unless Admin.exists?(email: 'bbb@sample.com')

Genre.create(name: 'アクション') unless Genre.exists?(name: 'アクション')
Genre.create(name: 'コメディー') unless Genre.exists?(name: 'コメディー')
Genre.create(name: 'ホラー') unless Genre.exists?(name: 'ホラー')
Genre.create(name: 'ミステリー') unless Genre.exists?(name: 'ミステリー')
Genre.create(name: 'ロマンス') unless Genre.exists?(name: 'ロマンス')
Genre.create(name: 'SF') unless Genre.exists?(name: 'SF')