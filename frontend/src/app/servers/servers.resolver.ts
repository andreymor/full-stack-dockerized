import {Injectable, Injector} from '@angular/core';
import {Router, Resolve, ActivatedRouteSnapshot} from '@angular/router';
import {CoreListItemResolver} from "../../core/resolver/core.list-item.resolver";
import {ServersService} from "./servers.service";
import {CoreHttpService} from "../../core/http/core.http.service";

@Injectable()
export class ServersResolver extends CoreListItemResolver<ServersService> {

    /**
     *
     * @param router
     * @param httpService
     */
    constructor(protected router: Router, httpService: ServersService) {
        super(router, httpService);
    }

    /**
     *
     * @param route
     * @returns {Promise<{queryParams: {}}>}
     */
    buildQuery(route: ActivatedRouteSnapshot): Promise<any> {
        return Promise.resolve({queryParams: {page: 1, itemsPerPage: 10}});
    }

    /**
     *
     * @param route
     * @param data
     * @returns {Promise<T>}
     */
    async configureDataResolved(route: ActivatedRouteSnapshot, data): Promise<any> {
        return Promise.resolve(data)
    }
}
