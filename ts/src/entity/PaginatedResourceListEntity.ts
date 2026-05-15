
import { inspect } from 'node:util'

import { PokapiEntityBase } from '../PokapiEntityBase'

import type {
  PokapiSDK,
} from '../PokapiSDK'


import type {
  Operation,
  Context,
  Control,
} from '../types'


// TODO: needs Entity superclass
class PaginatedResourceListEntity extends PokapiEntityBase {

  constructor(client: PokapiSDK, entopts: any) {
    super(client, entopts)
    this.name = 'paginated_resource_list'
    this.name_ = 'paginated_resource_list'
    this.Name = 'PaginatedResourceList'
  }


  make(this: PaginatedResourceListEntity) {
    return new PaginatedResourceListEntity(this._client, this.entopts())
  }







}


export {
  PaginatedResourceListEntity
}
