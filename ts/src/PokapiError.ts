
import { Context } from './Context'


class PokapiError extends Error {

  isPokapiError = true

  sdk = 'Pokapi'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  PokapiError
}

