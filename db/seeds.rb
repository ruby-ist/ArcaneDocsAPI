# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([
                 {session_id: "one"},
                 {session_id: "two"},
                 {session_id: "three"},
                 {session_id: "four"},
                 {session_id: "five"}
             ])

Post.create!([
                 {
                     title: "Test post 1",
                     user_id: 3,
                 },
                 {
                     title: "Test post 2",
                     user_id: 5,
                 }
             ])

Image.create!([
                  {
                      image_url: "url.jpg",
                      post: Post.third,
                  },
                  {
                      image_url: "url2.jpg",
                      post: Post.third,
                  },
                  {
                      image_url: "url3.jpg",
                      post: Post.third,
                  },
                  {
                      image_url: "post1.jpg",
                      post: Post.fourth,
                  },
                  {
                      image_url: "post2.jpg",
                      post: Post.fourth,
                  }
              ])

Share.create!([
                  {
                      from_id: 3,
                      to_id: 4,
                      post: Post.third,
                  },
                  {
                      from_id: 4,
                      to_id: 5,
                      post: Post.third,
                  },
                  {
                      from_id: 5,
                      to_id: 6,
                      post: Post.third
                  }
              ])