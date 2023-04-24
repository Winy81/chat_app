require 'spec_helper'
require 'rails_helper'

describe RoomsController, type: :controller do

  before do
    @john = User.create(username:"John", email:"john@test.com", password:"password")
    @first_room = Room.create(name: "First Room")
    @second_room = Room.create(name: "Second Room")

    sign_in(@john)
  end

  describe 'GET index' do

    let(:room) { double :room }

    it 'should assigns rooms and room' do

      expect(Room).to receive(:all).and_return([@first_room,@second_room])
      expect(Room).to receive(:new).and_return(room)

      get :index

      expect(assigns(:rooms)).to eq([@first_room,@second_room])
      expect(assigns(:room))

    end
  end

  describe 'GET create' do

    let(:room) { double :room }

    it 'should assigns rooms and room' do

      describe 'When the user under the limit to create room' do

        describe 'When the room has saved' do

          describe 'When the room is secured' do

            describe 'When the access has permitted' do

              it 'Should create access for the room' do

              end
            end

            describe 'When the access has denied' do

              it 'Should also delete the room' do

              end
            end
          end

          describe 'When the room is NOT secured' do

            it 'Should create the room' do

            end
          end
        end

        describe 'When the room has NOT saved' do

          it 'Should be redirected with an error' do

          end
        end
      end

      describe 'When the user above the limit to create room' do

        it 'should refuse the create more room' do

        end
      end
    end
  end
end