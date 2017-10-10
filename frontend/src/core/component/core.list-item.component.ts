import {CoreComponent} from "./core.component";
import {ActivatedRoute, Router} from "@angular/router";
import {CoreFormGroup} from "../form/core.form-group";
import {CoreFormSearchComponent} from "./core.form-search.component";
import {CoreHttpService} from "../http/core.http.service";

export abstract class CoreListItemComponent extends CoreFormSearchComponent {
    queryParams: any;

    listData: Array<any>;

    constructor(protected activatedRoute: ActivatedRoute, protected httpService: CoreHttpService, protected router: Router) {
        super(activatedRoute, httpService);
    }

    /**
     *
     * @param data
     */
    resolveData(response) {
        console.log('DATA', response);
        this.listData = response.data.list;
        this.formData = response.data.form || {};
    }

    onSubmit() {
        super.onSubmit();
    }

    /**
     *
     * @param query
     */
    find(query) {

        // recupera os parametros atuais e altera apenas o necessário
        let currentParams = {};

        // copia current params da rota
        Object.keys(this.activatedRoute.snapshot.queryParams).forEach(key => {
            currentParams[key] = this.activatedRoute.snapshot.queryParams[key];
        });

        // sobrescreve os parametros copiados com a nova configuração
        Object.keys(query).forEach(key => {
            currentParams[key] = query[key];
        });

        this.router.navigate([], {queryParams: currentParams});
    }
}
