TornadoApi::Application.routes.draw do
  scope :module => "api" do
    scope :module => "v1" do
      post 'change/create' => 'change#create'
      post 'page/show' => 'page#show'
    end
  end
end
