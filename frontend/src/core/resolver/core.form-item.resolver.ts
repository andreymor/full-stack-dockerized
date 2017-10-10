import {Router} from "@angular/router";
import {CoreHttpService} from "../http/core.http.service";
import {CoreItemResolver} from "./core.item.resolver";

export abstract class CoreFormItemResolver<T extends CoreHttpService> extends CoreItemResolver<T> {

    constructor(protected router: Router, httpService: CoreHttpService) {
        super(router, httpService);
    }
   
}