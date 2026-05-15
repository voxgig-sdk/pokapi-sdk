# Pokapi SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

PokapiUtility.registrar = ->(u) {
  u.clean = PokapiUtilities::Clean
  u.done = PokapiUtilities::Done
  u.make_error = PokapiUtilities::MakeError
  u.feature_add = PokapiUtilities::FeatureAdd
  u.feature_hook = PokapiUtilities::FeatureHook
  u.feature_init = PokapiUtilities::FeatureInit
  u.fetcher = PokapiUtilities::Fetcher
  u.make_fetch_def = PokapiUtilities::MakeFetchDef
  u.make_context = PokapiUtilities::MakeContext
  u.make_options = PokapiUtilities::MakeOptions
  u.make_request = PokapiUtilities::MakeRequest
  u.make_response = PokapiUtilities::MakeResponse
  u.make_result = PokapiUtilities::MakeResult
  u.make_point = PokapiUtilities::MakePoint
  u.make_spec = PokapiUtilities::MakeSpec
  u.make_url = PokapiUtilities::MakeUrl
  u.param = PokapiUtilities::Param
  u.prepare_auth = PokapiUtilities::PrepareAuth
  u.prepare_body = PokapiUtilities::PrepareBody
  u.prepare_headers = PokapiUtilities::PrepareHeaders
  u.prepare_method = PokapiUtilities::PrepareMethod
  u.prepare_params = PokapiUtilities::PrepareParams
  u.prepare_path = PokapiUtilities::PreparePath
  u.prepare_query = PokapiUtilities::PrepareQuery
  u.result_basic = PokapiUtilities::ResultBasic
  u.result_body = PokapiUtilities::ResultBody
  u.result_headers = PokapiUtilities::ResultHeaders
  u.transform_request = PokapiUtilities::TransformRequest
  u.transform_response = PokapiUtilities::TransformResponse
}
