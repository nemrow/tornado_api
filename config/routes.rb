TornadoApi::Application.routes.draw do
  post 'api/v1/change/create' => 'api/v1/change#create'
  post 'api/v1/page/show' => 'api/v1/page#show'
end
