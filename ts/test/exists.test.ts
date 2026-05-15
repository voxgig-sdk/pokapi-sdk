
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { PokapiSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await PokapiSDK.test()
    equal(null !== testsdk, true)
  })

})
