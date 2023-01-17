defmodule BXApiExampleWeb.TestController do
  use BXApiExampleWeb, :controller

  alias BXApiExample.Tests
  alias BXApiExample.Tests.Test

  # {
  # @api {get} /test_entity/ List Tests
  # @apiName ListTests
  # @apiGroup Tests
  # @apiVersion 0.31.0

  # @apiParam (Query Parameters) {Number} limit=500 Limit the number of returned elements
  # @apiParam (Query Parameters) {String } [id] get a single id
  # @apiParam (Query Parameters) {String[]} [id] get a list of id's

  # @apiSuccessExample Success-Response:
  #   HTTP/1.1 200 OK
  #   [
  #     {
  #       "name": "API",
  #       "id": "5fcc2352-aa5a-4ad2-8c98-f6af5f9b7637",
  #       "tenant_id": "test"
  #     },
  #     {
  #       "name": "Tester",
  #       "id": "c59d0435-e0d8-4cb1-a8d2-16817fea405a",
  #       "tenant_id": "test"
  #     }
  #   ]

  #   @apiExample {curl} Example usage:
  #     curl -i http://api.example.com/api/test_entity?tenant_id=test&limit=2
  # }
  def index(conn, params) do
    result = Tests.list(params, conn)
    render(conn, "index.json", tests: result)
  end

  # {
  # @api {post} /test_entity/ Create
  # @apiGroup Tests
  # @apiName CreateTest
  # @apiVersion 0.31.0

  # @apiParam (Body) {String} name the name of the element
  # @apiParam (Body) {String} tenant_id the tenant this element should belong to
  # @apiParam (Body) {Object} settings={} a object of special settings for this element

  # @apiSuccessExample Success-Response:
  #   HTTP/1.1 201 Created
  #   {
  #     "id": "5fcc2352-aa5a-4ad2-8c98-f6af5f9b7637",
  #     "name": "Test 183",
  #     "tenant_id": "test",
  #     "settings": { "foo": 1337 }
  #   }

  # @apiExample {curl} Curl:
  #    curl -X POST -i http://api.example.com/api/test_entity -d '{
  #     "name": "Test 183",
  #     "tenant_id": "test",
  #     "settings": { "foo": 1337 }
  #   }'
  # }
  def create(conn, test_params) do
    with {:ok, %Test{} = result} <- Tests.create_Test(test_params) do
      conn
      |> put_status(:created)
      |> render("show.json", test: result)
    end
  end
end
