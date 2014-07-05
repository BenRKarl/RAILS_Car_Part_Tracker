require 'spec_helper'

describe CarsController do

  describe 'given a car' do

    before :each do
      @batmobile = Car.new
      @batmobile.name = 'The Batmobile'
      @batmobile.VIN = '12343e23sda'
      @batmobile.make = 'Bat'
      @batmobile.model = 'Mobile'
      @batmobile.save
    end

    describe 'GET index' do
      before :each do
        get :index
      end

      it 'responds successfully' do
        expect(response.code).to eq('200')
      end

      it 'assigns @cars' do
        actual = assigns(:cars)
        expected = [@batmobile]
        expect(actual).to eq(expected)
      end
    end #GET index

    describe 'GET show' do
      before :each do
        get :show, :id => @batmobile.id
      end

      it 'responds successfully' do
        expect(response.code).to eq('200')
      end

      it 'assigns @car' do
        actual = assigns(:car)
        expected = @batmobile
        expect(actual).to eq(expected)
      end

      it 'renders the show template' do
        expect(response).to render_template('show')
      end
    end #GET show

    describe 'GET edit' do
      before :each do
        get :edit, :id => @batmobile.id
      end

      it 'responds successfully' do
        expect(response.code).to eq('200')
      end

      it 'assigns @car' do
        actual = assigns(:car)
        expected = @batmobile
        expect(actual).to eq(expected)
      end

      it 'renders the edit template' do
        expect(response).to render_template('edit')
      end
    end #GET edit

    describe 'POST update' do
      before :each do
        post :update, {:id => @batmobile.id, :car => {name: 'The Hatmobile'}}
      end

      it 'repsonds with a redirect' do
        actual = response.code
        expected = '302'
        expect(actual).to eq(expected)
      end

      it 'updates a car record' do
        @batmobile.reload
        actual = @batmobile.name
        expected = "The Hatmobile"
        expect(actual).to eq(expected)
      end

      it 'redirects to the show page' do
        response.should redirect_to car_path(@batmobile)
      end
    end #POST update

    describe 'DELETE destroy' do
      it 'destroys a car record' do
        expect { delete :destroy, {:id => @batmobile.id} }
        .to change(Car, :count).by(-1)
      end
    end #DELETE destroy

  end #Given a person

  describe 'GET new' do
    before :each do
      get :new
    end

    it 'responds successfully' do
      expect(response.code).to eq('200')
    end

    it 'renders the new template' do
      expect(response).to render_template('new')
    end
  end #GET new

  describe 'POST create' do
    before :each do
      post :create, {:car => {name: 'The Batmobile', VIN: '12343e23sda', make: 'Bat', model: 'Mobile'}}
    end

    it 'responds with a redirect' do
      actual = response.code
      expected = '302'
      expect(actual).to eq(expected)
    end

    it 'inserts a person record' do
      actual = Car.last.name
      expected = 'The Batmobile'
      expect(actual).to eq(expected)
    end

    it 'redirects to the cars index' do
      response.should redirect_to cars_path
    end
  end #POST create
end # CarsController
