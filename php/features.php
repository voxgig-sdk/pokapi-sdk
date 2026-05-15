<?php
declare(strict_types=1);

// Pokapi SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class PokapiFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new PokapiBaseFeature();
            case "test":
                return new PokapiTestFeature();
            default:
                return new PokapiBaseFeature();
        }
    }
}
