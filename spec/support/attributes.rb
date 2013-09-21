def movie_attributes(overrides={})
  {
    title: "Iron Man",
    rating: "PG-13",
    total_gross: 318412101.00,
    description: "Tony Stark builds an armored suit to fight the throes of evil",
    released_on: "2013-05-05",
    director: 	"Jon Favreau",
    duration: 	"126 min",
    cast: "Tony Stark builds an armored suit to"
   

  }.merge(overrides)
end

def review_attributes(overrides = {})
  {
    name: "Roger Ebert",
    stars: 3,
    comment: "I laughed, I cried, I spilled my popcorn!"
  }.merge(overrides)
end
