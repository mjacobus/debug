Rails.application.routes.draw do
  post 'debug/render_params', to: "debug#render_params"
end
