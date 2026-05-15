<?php
declare(strict_types=1);

// Pokapi SDK utility: feature_add

class PokapiFeatureAdd
{
    public static function call(PokapiContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
