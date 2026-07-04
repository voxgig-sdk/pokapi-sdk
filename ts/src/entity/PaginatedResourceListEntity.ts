
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

import type {
  PaginatedResourceList,
} from '../PokapiTypes'

// TODO: needs Entity superclass
class PaginatedResourceListEntity extends PokapiEntityBase<PaginatedResourceList> {

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
