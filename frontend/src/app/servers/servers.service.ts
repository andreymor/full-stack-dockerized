import {Injectable, Injector} from '@angular/core';
import {CoreHttpService} from "../../core/http/core.http.service";
import {Http} from "@angular/http";

@Injectable()
export class ServersService extends CoreHttpService {

  constructor(protected http: Http) {
    super(http);
    this.uri = '/api/v1/servers';
  }

}
