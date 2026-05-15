<?php
declare(strict_types=1);

// Pokapi SDK utility: result_headers

class PokapiResultHeaders
{
    public static function call(PokapiContext $ctx): ?PokapiResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
