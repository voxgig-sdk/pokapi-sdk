<?php
declare(strict_types=1);

// Pokapi SDK exists test

require_once __DIR__ . '/../pokapi_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = PokapiSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
