import { Injector } from '@angular/core';
import { Router, Resolve, ActivatedRouteSnapshot } from '@angular/router';
import {CoreHttpService} from "../http/core.http.service";
import {CoreResolver} from "./core.resolver";
import {Query} from "../http/core.http.query.model";

/**
 * classe que resolve um item para detalhamento
 */
export abstract class CoreItemResolver<T extends CoreHttpService> extends CoreResolver<T> {

    /**
     *
     * @param router
     * @param httpService
     */
    constructor(protected router: Router, protected httpService: CoreHttpService) {
        super(router, httpService);
    }

    /**
     *
     * @param query
     * @returns {Promise<any>}
     */
    fetchData(query: Query): Promise<any> {
        return this.httpService.cGet(query);
    }

    /**
     *
     * @param route
     */
    buildQuery(route: ActivatedRouteSnapshot): Promise<any> {
        let id: string = route.params['id'] || '';
        return Promise.resolve({ pathParams: { id } });
    }

}