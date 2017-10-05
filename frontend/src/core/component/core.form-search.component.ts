import {Injector, OnInit, OnDestroy, Output, EventEmitter} from '@angular/core';
import {CoreItemComponent} from "./core.item.component";
import {CoreFormGroup} from "../form/core.form-group";
import {ActivatedRoute} from "@angular/router";
import {CoreHttpService} from "../http/core.http.service";
import {Query} from "../http/core.http.query.model";
import {CoreFormComponent} from "./core.form.component";


/**
 * componente de base para edição de um registro qualquer.
 *
 * Para adicionar validação implemente a trait Validable
 */
export abstract class CoreFormSearchComponent extends CoreFormComponent {

    listData: Array<any>;

    constructor(protected activatedRoute: ActivatedRoute, protected httpService: CoreHttpService) {
        super(activatedRoute, httpService);
    }

    /**
     *
     * @returns {Promise<any>}
     */
    onSubmit() {
        this.prepareDataToSubmit();
        this.submitData.page = 1;
        this.submitData.itemsPerPage = 10;

        let params = new Query();
        params.queryParams = this.submitData;

        this.httpService.cGet(params).then(result => {
            this.listData = result;
            console.log('data', this.listData);
        }).catch(result => {
            console.log(result);
        });
    }

    /**
     *
     * @param item
     */
    prepare(item?: any): Promise<any> {
        return Promise.resolve(this.formData);
    }
}
