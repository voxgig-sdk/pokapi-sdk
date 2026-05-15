<?php
declare(strict_types=1);

// Pokapi SDK utility: prepare_body

class PokapiPrepareBody
{
    public static function call(PokapiContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
