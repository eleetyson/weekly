# create an account and post for Michelle
michelle = User.create(name: "Michelle Obama", username: "mobama", password: "firstlady")
Post.create(title: "The Michelle Obama Podcast - Episode 1: President Barack Obama", medium: "Podcast", link: "https://open.spotify.com/show/71mvGXupfKcmO6jlmOJQTP?", user: michelle)

# create an account and post for Elon
elon = User.create(name: "Elon Musk", username: "emusk", password: "imtheking")
Post.create(title: "The Joe Rogan Experience: #1169 - Elon Musk", medium: "Podcast", link: "https://www.stitcher.com/podcast/the-joe-rogan-experience/e/56151455", user: elon)

# create an account and post twice for me :)
ethan = User.create(name: "Ethan Lee-Tyson", username: "eleetyson", password: "pw")
Post.create(title: "How to Talk About Books You Haven't Read", medium: "Book", link: "https://www.amazon.com/Talk-About-Books-Havent-Read/dp/1596915439", user: ethan)
Post.create(title: "The Best Speech About Humanity", medium: "Video", link: "https://www.youtube.com/watch?v=EWPFmdAWRZ0&feature=emb_logo", user: ethan)

# create an account and post for Neil
postman = User.create(name: "Neil Postman", username: "postman99", password: "mailtime")
Post.create(title: "Brave New World", medium: "Book", link: "https://www.amazon.com/Brave-New-World-Aldous-Huxley/dp/0060850523", user: postman)

# create an account and post twice for Katrina
katrina = User.create(name: "Katrina Lake", username: "katrina_lake", password: "sfix")
Post.create(title: "Amazon Private Labels and Antitrust", medium: "Blog Post", link: "https://themargins.substack.com/p/amazon-private-labels-and-antitrust", user: katrina)
Post.create(title: "An Open Letter on Sustainability", medium: "Article", link: "https://2pml.com/2020/02/22/sustainability/", user: katrina)

# create an account and post for Serena
serena = User.create(name: "Serena Williams", username: "serenaw2", password: "grandslam")
Post.create(title: "Loyalty Over Everything", medium: "Article", link: "https://www.theplayerstribune.com/en-us/articles/damian-lillard-loyalty-over-everything", user: serena)
