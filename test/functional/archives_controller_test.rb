require File.join(File.dirname(__FILE__), '..', 'test_helper')

class ArchivesControllerTest < ActionController::TestCase
  setup do 
    @controller = ArchivesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  context 'on GET to :index' do
    setup do
      get :index
    end

    should_assign_to :archives
    should_render_template :index
    should_respond_with :success
  end

end
