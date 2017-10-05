import {Router} from "@angular/router";
import {CoreHttpService} from "../http/core.http.service";
import {CoreItemResolver} from "./core.item.resolver";
 
/**
 * classe que resolve um item para edição junto ao serviço
 */
export abstract class CoreFormItemResolver<T extends CoreHttpService> extends CoreItemResolver<T> {

    constructor(protected router: Router, httpService: CoreHttpService) {
        super(router, httpService);
    }
   
}