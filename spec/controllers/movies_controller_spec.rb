require 'spec_helper'

describe MoviesController do
  describe 'Buscador de peliculas por director' do
    it 'no tiene director' do
      fake_movie=mock('Movie', :title => 'Chocolat', :director => '')
      Movie.should_receive(:find_by_id).and_return(fake_movie)
      get :search_same_director, {:id => '1'}
      response.should redirect_to(movies_path) 
    end
    it 'hay dos pelis con el mismo director' do
      fake_movie1=mock('Movie', :title => 'Chocolat', :director => 'prueba')
      fake_movie2=mock('Aladdin', :title => 'Chocolat', :director => 'prueba')
      Movie.should_receive(:find_by_id).and_return(fake_movie1)
      Movie.should_receive(:find_all_by_director).and_return(fake_movie2)
      get :search_same_director, {:id => '1'}
      response.should render_template('search_same_director')
    end
    it 'solo una peli tiene un director en concreto' do
      fake_movie=mock('Movie', :title => 'Chocolat', :director => 'prueba')
      Movie.should_receive(:find_by_id).and_return(fake_movie)
      Movie.should_receive(:find_all_by_director).and_return(fake_movie)
      get :search_same_director, {:id => '1'}
      response.should render_template('search_same_director') 
    end
  end
  
  describe 'searching TMDb' do
    it 'should call the model method that performs TMDb search' do
      Movie.should_receive(:find_in_tmdb).with('hardware')
      post :search_tmdb, {:search_terms => 'hardware'}
    end
    it 'should select the Search Results template for rendering' do
      Movie.stub(:find_in_tmdb)
      post :search_tmdb, {:search_terms => 'hardware'}
      response.should render_template('search_tmdb')
    end

    it 'should make the TMDb search results available to that template' do 
      fake_results = [mock('Movie'), mock('Movie')]
      Movie.stub(:find_in_tmdb).and_return(fake_results)
      post :search_tmdb, {:search_terms => 'hardware'}
      # look for controller method to assign @movies
      assigns(:movies).should == fake_results
    end

    it 'should redirect to movies path if key is invalid' do
      Movie.stub(:find_in_tmdb).and_raise(Movie::InvalidKeyError)
      post :search_tmdb, {:search_terms => 'Torrente'}
      response.should redirect_to(movies_path)
    end
  end
  describe 'funcionality RP' do
    it 'show the index page' do
      get :index
      response.should render_template("index")
    end

    it 'show movie' do
      fake_movie = mock('movie1', :title => 'Torrente')
      Movie.stub(:find).with('1').and_return(fake_movie)
      get :show, {:id => 1}
      response.should render_template("show")
    end

    it 'create movie' do
      fake_movie= mock('movie1', :title => 'Torrente')
      Movie.should_receive(:create!).and_return(fake_movie)
      get :create, {:movie => fake_movie}
      flash[:notice].should == "Torrente was successfully created."
    end

    it 'edit movie' do
      fake_movie = mock('movie')
      Movie.stub(:find).with('1').and_return(fake_movie)
      get :edit, {:id => 1}
      response.should render_template("edit")
    end

    it 'should update the movie' do
      fake_movie = mock('movie', :title => 'Torrente')
      Movie.stub(:find).with('1').and_return(fake_movie)
      fake_movie.should_receive(:update_attributes!)
      post :update, {:id => '1', :movie => fake_movie}
    end

    it 'should delete a movie' do
      fake_movie= mock('movie1', :title => 'Torrente')      
      Movie.should_receive(:find).with('1').and_return(fake_movie)
      fake_movie.should_receive(:destroy).and_return(true)
      post :destroy, {:id => '1'}
      response.should redirect_to(movies_path)
    end

    it 'edit ratings' do
      get :index, {:ratings => 'PG'}
      session[:ratings].should == 'PG'
    end

    it "order by date" do
      session[:sort] = 'release_date'
      Movie.stub(:find_all_by_rating).with(anything(), {:order => :release_date})
      get :index, {:sort => 'release_date'}
    end

    it "order by title" do
      session[:sort] = 'title'
      Movie.stub(:find_all_by_rating).with(anything(), {:order => :title})
      get :index, {:sort => 'title'}
    end
  end
end
