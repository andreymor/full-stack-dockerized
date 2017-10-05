import { Router, ActivatedRouteSnapshot } from '@angular/router';

import {CoreHttpService} from "../http/core.http.service";
import {CoreListItemResolver} from "./core.list-item.resolver";

export abstract class CorePageListItemResolver<T extends CoreHttpService> extends CoreListItemResolver<T> {
    /**
     *
     * @param router
     * @param httpService
     */
    constructor(protected router: Router, httpService: CoreHttpService) {
        super(router, httpService);
    }

    /**
     *
     * @param route
     */
    buildQuery(route: ActivatedRouteSnapshot): Promise<any> {
        let page: number = parseInt(route.queryParams['page'] || 1);
        let itemsPerPage: number = parseInt(route.queryParams['itemsPerPage'] || 10);

        return Promise.resolve({ queryParams: {  page, itemsPerPage } });
    }
    
}