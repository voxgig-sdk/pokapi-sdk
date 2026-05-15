<?php
declare(strict_types=1);

// Pokapi SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class PokapiMakeContext
{
    public static function call(array $ctxmap, ?PokapiContext $basectx): PokapiContext
    {
        return new PokapiContext($ctxmap, $basectx);
    }
}
