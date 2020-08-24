# create an account and post for Michelle
michelle = User.create(username: "mobama", password: "firstlady")
Post.create(title: "The Michelle Obama Podcast - Episode 1: President Barack Obama", medium: "Podcast", link: "https://open.spotify.com/show/71mvGXupfKcmO6jlmOJQTP?", user: michelle)

# create an account and post for Elon
elon = User.create(username: "emusk", password: "imtheking")
Post.create(title: "The Joe Rogan Experience: #1169 - Elon Musk", medium: "Podcast", link: "https://www.stitcher.com/podcast/the-joe-rogan-experience/e/56151455", user: elon)

# create an account and post twice for me :)
ethan = User.create(username: "eleetyson", password: "pw")
Post.create(title: "How to Talk About Books You Haven't Read", medium: "Book", link: "https://www.amazon.com/Talk-About-Books-Havent-Read/dp/1596915439", user: ethan)
Post.create(title: "The Best Speech About Humanity", medium: "Video", link: "https://www.youtube.com/watch?v=EWPFmdAWRZ0&feature=emb_logo", user: ethan)
