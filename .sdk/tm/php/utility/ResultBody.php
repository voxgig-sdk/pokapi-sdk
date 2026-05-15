<?php
declare(strict_types=1);

// Pokapi SDK utility: result_body

class PokapiResultBody
{
    public static function call(PokapiContext $ctx): ?PokapiResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
