import {Injector, OnInit, OnDestroy, Output, EventEmitter} from '@angular/core';
import {CoreItemComponent} from "./core.item.component";
import {CoreFormGroup} from "../form/core.form-group";
import {ActivatedRoute} from "@angular/router";
import {CoreHttpService} from "../http/core.http.service";
import {Query} from "../http/core.http.query.model";
import {CoreFormComponent} from "./core.form.component";

export abstract class CoreFormItemComponent extends CoreFormComponent {
    idItem: any;

    constructor(protected activatedRoute: ActivatedRoute, protected httpService: CoreHttpService) {
        super(activatedRoute, httpService);
    }
    /**
     *
     */
    async onSubmit() {

        this.prepareDataToSubmit();
        let submitted: any = {};

        try {
            let params = new Query();
            params.pathParams = {id: null};
            params.data = this.submitData;

            if (this.idItem) {
                params.pathParams.id = +this.idItem;
                params.data.id = +this.idItem;
                submitted = await  this.httpService.put(params);
            }
            else {
                submitted = await this.httpService.post(params);
            }

            //this.notificacaoService.success('Sucesso', 'Informações incluídas com sucesso');
            this.onSuccess.emit(submitted);

        } catch (e) {
            //this.notificacaoService.error('Erro', 'Ocorreu um erro')
        }
    }

    /**
     *
     * @param item
     */
    prepare(item?: any): Promise<any> {
        this.idItem = (typeof item != 'undefined' && item != null) ? item.id : null;
        this.form.get('formInput').reset();
        return Promise.resolve(this.formData);
    }
}
