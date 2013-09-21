require 'spec_helper'
describe "Viewing the list of movies" do
  
  it "shows the movies" do
    movie1 = Movie.create(title: "Superman",
                      rating: "PG-13",
                      total_gross: 318412101.00,
                      description: "Tony Stark builds an armored suit to fight the throes of evil",
                      released_on: "2008-05-02",
                      cast:  "Robert Downey Jr., Gwyneth Paltrow and Terrence Howard",
                      director:   "Jon Favreau",
                      duration:   "126 min")

    movie2 = Movie.create(title: "Iron Man",
                      rating: "PG",
                      total_gross: 134218018.00,
                      description: "Clark Kent grows up to be the greatest super-hero",
                      released_on: "1978-12-15",
                      cast:   "Robert Downey Jr., Gwyneth Paltrow and Terrence Howard",
                      duration:   "121 min",
                      director:  "Sam Raim")

     movie3 = Movie.create(title: "Spider-Man",
                      rating: "PG-13",
                      total_gross: 403706375.00,
                      description: "Peter Parker gets bit by a genetically modified spider",
                      released_on: "2002-05-03",
                      cast:   "Tobey Maguire, Kirsten Dunst and Willem Dafoe",
                      director:   "Sam Raimi",
                      duration:   "121 min")
     visit movies_url
     expect(page).to have_text(movie1.title)
     expect(page).to have_text(movie2.title)
     expect(page).to have_text(movie3.title)

     expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description[0..10])
    expect(page).to have_text(movie1.released_on)
    expect(page).to have_text("$318,412,101.00")
  end

  it "does not show a movie that hasn't yet been released" do

    movie = Movie.create(movie_attributes(released_on: 1.month.from_now))
  
    visit movies_path
  
    expect(page).to have_text(movie.title)
  end

  it "is released when the released on date is in the past" do
  movie = Movie.create(movie_attributes(released_on: 3.months.ago))
 
  expect(Movie.released).to include(movie)
end

it "is not released when the released on date is in the future" do
  movie = Movie.create(movie_attributes(released_on: 3.months.from_now))
 
  expect(Movie.released).not_to include(movie)
end

it "returns released movies ordered with the most recently-released movie first" do
  movie1 = Movie.create(movie_attributes(released_on: 3.months.ago))
  movie2 = Movie.create(movie_attributes(released_on: 2.months.ago))
  movie3 = Movie.create(movie_attributes(released_on: 1.months.ago))
 
  expect(Movie.released).to eq([movie3, movie2, movie1])
end

  
end