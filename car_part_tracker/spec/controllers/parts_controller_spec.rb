require 'spec_helper'

describe PartsController do

  describe 'given a car' do
    before :each do
      @batmobile            = Car.new
      @batmobile.name       = 'The Batmobile'
      @batmobile.VIN        = '12343e23sda'
      @batmobile.make       = 'Bat'
      @batmobile.model      = 'Mobile'
      @batmobile.save
    end

  describe 'given a part' do
    before :each do
      @wheel                = Part.new
      @wheel.name           = "Batwheel"
      @wheel.part_type      = '24" wheel'
      @wheel.part_number    = '130dsank'
      @wheel.repair_details = 'Put a new wheel on the Batmobile.'
      @wheel.save
    end

    describe 'GET show' do
      before :each do
        get :show, :car_id => @batmobile.id, :id => @wheel.id
      end

      it 'responds successfully' do
        expect(response.code).to eq('200')
      end

      it 'assigns @part' do
        actual = assigns(:part)
        expected = @wheel
        expect(actual).to eq(expected)
      end

      it 'renders the show template' do
        expect(response).to render_template('show')
      end
    end #GET show

    describe 'GET edit' do
      before :each do
        get :edit, :car_id => @batmobile.id, :id => @wheel.id
      end

      it 'responds successfully' do
        expect(response.code).to eq('200')
      end

      it 'assigns @part' do
        actual = assigns(:part)
        expected = @wheel
        expect(actual).to eq(expected)
      end

      it 'renders the edit template' do
        expect(response).to render_template('edit')
      end
    end #GET edit

    describe 'POST update' do
      before :each do
        post :update, :car_id => @batmobile.id, :id => @wheel.id, :part => {name: 'Tire'}
      end

      it 'responds with a redirect' do
        actual = response.code
        expected = '302'
        expect(actual).to eq(expected)
      end

      it 'updates a part record' do
        @wheel.reload
        actual = @wheel.name
        expected = 'Tire'
        expect(actual).to eq(expected)
      end

      it 'redirects to show' do
        response.should redirect_to car_path(@batmobile)
      end
    end #POST update

    describe 'DELETE destroy' do
      it 'destroys a part record' do
        expect { delete :destroy, :car_id => @batmobile.id, :id => @wheel.id }
        .to change(Part, :count).by(-1)
      end
    end #DELETE destroy
  end #Given a part

  describe 'GET new' do
    before :each do
      get :new, :car_id => @batmobile.id
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
      post :create,
      :car_id => @batmobile.id,
      :part => {
        name: 'windshield',
        part_type: 'a windshield',
        part_number: '19fnsanfp',
        repair_details: 'Fixed a cracked windshield on the batmobile'
      }
    end

    it 'responds with a redirect' do
      actual = response.code
      expected = '302'
      expect(actual).to eq(expected)
    end

    it 'inserts a part record' do
      actual = Part.last.name
      expected = 'windshield'
      expect(actual).to eq(expected)
    end

    it 'redirects to show' do
      response.should redirect_to car_path(@batmobile)
    end
  end #POST create
  end #Given a car
end #PartsController
