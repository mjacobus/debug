# Without content type set to json
#
# curl -X POST 'http://localhost:3000/debug/render_params' \
#   -H 'Accept: application/json' \
#   -H 'X-Requested-With: XMLHttpRequest' \
#   -d '{"text":"hey there"}' | jq
#
# {
#   "{\"text\":\"hey there\"}": null,
#   "controller": "debug",
#   "action": "render_params"
# }
#
# With content type set to json
#
# curl -X POST 'http://localhost:3000/debug/render_params' \
#   -H 'Content-Type: application/json' \
#   -H 'Accept: application/json' \
#   -H 'X-Requested-With: XMLHttpRequest' \
#   -d '{"text":"hey there"}' | jq
#
# {
#   "text": "hey there",
#   "controller": "debug",
#   "action": "render_params",
#   "debug": {
#     "text": "hey there"
#   }
# }
class DebugController < ActionController::Base
  protect_from_forgery unless: -> { true }

  def render_params
    render json: params.permit!.to_h
  end
end
