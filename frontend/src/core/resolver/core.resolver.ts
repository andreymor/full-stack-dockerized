import {Injectable} from '@angular/core';
import {Router, Resolve, ActivatedRouteSnapshot} from '@angular/router';
import {CoreHttpService} from "../http/core.http.service";

@Injectable()
export abstract class CoreResolver<T extends CoreHttpService> implements Resolve<any> {

    constructor(protected router: Router, protected httpService: CoreHttpService) {
    }

    /**
     * Método que faz a resolução dos dados
     */
    async resolve(route: ActivatedRouteSnapshot): Promise<any> {
        try {
            let query = await this.buildQuery(route);

            let fetchedData = await this.fetchData(query);

            let data = await this.configureData(route, fetchedData);

            return Promise.resolve(data);
        } catch (err) {
            return Promise.reject(err);
        }

    }

    /**
     * método que efetivamente faz a consulta
     */
    abstract fetchData(query): Promise<any>;

    /**
     * método que configura os dados resolvidos para ser repassado para o componente.
     */
    configureData(route: ActivatedRouteSnapshot, data: any): Promise<any> {
        return Promise.resolve(data);
    }

    /**
     * Método usado para construir a consulta que será usado para o fetch dos dados
     */
    abstract buildQuery(route: ActivatedRouteSnapshot): Promise<any>;
}