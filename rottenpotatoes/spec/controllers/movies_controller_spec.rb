require 'rails_helper'
require 'spec_helper'



describe MoviesController, type: :controller do

    context "When the movie has no director" do
      it "should redirect to the movies page" do
        @movie_id = "0000"
        @movie = double(:title => 'test_movie').as_null_object

        expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)

        get :director, :id => @movie_id
        expect(response).to redirect_to(movies_path)
      end
    end
  

  describe "#sort"do
    context "When sort by director" do
      it "should sort all movies by director's name" do
        get :index, :sort => :director, :ratings => ["R","PG"]
      end
    end
    context "When sort by title" do
      it "should sort all movies by title" do
        get :index, :sort => :title, :ratings => ["R","PG"]
      end
    end
    context "When sort by release_date" do
      it "should sort all movies by release_date" do
        get :index, :sort => :release_date, :ratings => ["G", "PG"]
      end
    end
  end

  describe "#new" do
    context "When create a movie" do
      it "should create it to database" do
        new = Hash.new
        new["title"] = "test_new_movie"
        new["director"] = "test_new_director"

        post :create, movie: new
        expect(response).to redirect_to("/movies")
      end
    end
  end
end
