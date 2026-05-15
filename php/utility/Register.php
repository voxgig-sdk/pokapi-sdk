<?php
declare(strict_types=1);

// Pokapi SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

PokapiUtility::setRegistrar(function (PokapiUtility $u): void {
    $u->clean = [PokapiClean::class, 'call'];
    $u->done = [PokapiDone::class, 'call'];
    $u->make_error = [PokapiMakeError::class, 'call'];
    $u->feature_add = [PokapiFeatureAdd::class, 'call'];
    $u->feature_hook = [PokapiFeatureHook::class, 'call'];
    $u->feature_init = [PokapiFeatureInit::class, 'call'];
    $u->fetcher = [PokapiFetcher::class, 'call'];
    $u->make_fetch_def = [PokapiMakeFetchDef::class, 'call'];
    $u->make_context = [PokapiMakeContext::class, 'call'];
    $u->make_options = [PokapiMakeOptions::class, 'call'];
    $u->make_request = [PokapiMakeRequest::class, 'call'];
    $u->make_response = [PokapiMakeResponse::class, 'call'];
    $u->make_result = [PokapiMakeResult::class, 'call'];
    $u->make_point = [PokapiMakePoint::class, 'call'];
    $u->make_spec = [PokapiMakeSpec::class, 'call'];
    $u->make_url = [PokapiMakeUrl::class, 'call'];
    $u->param = [PokapiParam::class, 'call'];
    $u->prepare_auth = [PokapiPrepareAuth::class, 'call'];
    $u->prepare_body = [PokapiPrepareBody::class, 'call'];
    $u->prepare_headers = [PokapiPrepareHeaders::class, 'call'];
    $u->prepare_method = [PokapiPrepareMethod::class, 'call'];
    $u->prepare_params = [PokapiPrepareParams::class, 'call'];
    $u->prepare_path = [PokapiPreparePath::class, 'call'];
    $u->prepare_query = [PokapiPrepareQuery::class, 'call'];
    $u->result_basic = [PokapiResultBasic::class, 'call'];
    $u->result_body = [PokapiResultBody::class, 'call'];
    $u->result_headers = [PokapiResultHeaders::class, 'call'];
    $u->transform_request = [PokapiTransformRequest::class, 'call'];
    $u->transform_response = [PokapiTransformResponse::class, 'call'];
});
