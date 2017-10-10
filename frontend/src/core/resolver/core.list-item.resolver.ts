import {Router, Resolve, ActivatedRouteSnapshot} from '@angular/router';
import {CoreHttpService} from "../http/core.http.service";
import {CoreItemResolver} from "./core.item.resolver";
import {CoreResolver} from "./core.resolver";
import {Query} from "../http/core.http.query.model";

export abstract class CoreListItemResolver<T extends CoreHttpService> extends CoreResolver<T> {


    constructor(protected router: Router, httpService: CoreHttpService) {
        super(router, httpService);
    }

    /**
     * resolve a lista de items do servico
     */
    fetchData(query: Query): Promise<any> {
        return this.httpService.cGet(query);
    }

    /*
     configureData(route: ActivatedRouteSnapshot, data): Promise<any> {
     return Promise.resolve({data});
     }
     */
}